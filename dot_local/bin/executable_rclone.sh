#!/bin/bash
# Input value
function typeVal() {
	while :
	do
		echo -n -e "$1\n > " >&2 && read rtn && echo "" >&2

		if [ -n "$rtn" ]; then
			break
    else
      echo -e "$(errMsg "Please type value!")" >&2
		fi
	done
	echo $rtn
}

function errMsg() {
  echo "\e[31m${1}\e[m"
}

# Select Cloud Service
while :
do
  what=$(typeVal "Type a cloud service.")
  if [ -n "$(grep "\[${what}\]" ~/.config/rclone/rclone.conf)" ]; then
    break
  else
    echo -e "$(errMsg "Not found \"${what}\".")"
  fi
done

# Select Mount Directory
while :
do
  where=$(typeVal "Type a mount directory.")
  if [ ! -d $where ]; then
    echo -e "$(errMsg "Not found \"${where}\".")"
  else
    srvfile=$(echo ${where//\//-} | cut -c 2-).mount
    break
  fi
done

# Create File
echo -e "\
[Unit]\n\
After=network-online.target\n\
[Mount]\n\
Type=rclone\n\
What=${what}:\n\
Where=${where}\n\
Options=vfs-cache-mode=full,cache-dir=~/.local/var/rclone\n\
[Install]\n\
WantedBy=default.target" > ~/.config/systemd/user/${srvfile}

# Enable Service
systemctl --user start $srvfile
systemctl --user enable $srvfile
