#!/bin/sh
set -e

# Setting Pacman
sed -i -e 's/#\(Color\|ParallelDownloads = 5\)/\1/' /etc/pacman.conf
echo Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/\$repo/os/\$arch > /etc/pacman.d/mirrorlist

# Setting Partition
echo -n -e "\n"
echo -n Type Partition:
read part
sgdisk -Z $part
sgdisk -o $part

sgdisk -n 1::+300M -t 1:ef00 $part
sgdisk -n 2:: -t 2:8304 $part

mkfs.vfat -F32 ${part}1
mkfs.ext4 ${part}2

# Mount
mount ${part}2 /mnt
mount --mkdir ${part}1 /mnt/boot

# Install Kernel
pacstrap /mnt base base-devel linux-zen linux-firmware linux-zen-headers

# Genfstab
genfstab -U /mnt >> /mnt/etc/fstab

# Copy Files
cp -r /root/installer /mnt/installer

# Create Shellfile
shfile=install2.sh
cat <<_EOF_> /mnt/$shfile
#!/bin/sh
# Setting Pacman
sed -i -e 's/#\(Color\|ParallelDownloads = 5\)/\1/' /etc/pacman.conf
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Set Timezone
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc

# Locale-Gen
sed -i -e 's/^#\(en_US\|ja_JP\)\(.UTF-8.*\)/\1\2/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo KEYMAP=jp106 > /etc/vconsole.conf

# Set Hostname
echo -n -e "\n"
echo -n Type Hostname:
read hostname
echo \$hostname > /etc/hostname
target=/etc/hosts
echo 127.0.0.1 localhost > \$target
echo ::1 localhost >> \$target
echo 127.0.1.1 \${hostname}.localdomain \${hostname}>> \$target

# Set Root Password
echo -n -e "\n"
echo -n Type Root Password:
read pw
echo root:\$pw | chpasswd

# Create User and Set User Password
echo -n -e "\n"
echo -n Type New User:
read user
useradd -m -g users -G wheel -s /bin/bash \${user}
echo -n -e "\n"
echo -n Type \${user} Password:
read pw
echo \$user:\$pw
echo \$user:\$pw | chpasswd

# Setting Sudoer
pacman -S --noconfirm sudo
sed -i -e 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Check CPU Vendor
cpu=\`lscpu | grep "Model name"\`
if [[ "\$cpu" ==  *Intel* ]] ; then
	ucode="intel-ucode"
elif [[ "\$cpu" ==  *AMD* ]] ; then
	ucode="amd-ucode"
fi

# Install Package
pacman -Syyu --noconfirm
pacman -S --noconfirm booster \$ucode neovim clamav ufw networkmanager pacman-contrib git go

# Systemd-boot
bootctl install

target=/boot/loader/loader.conf
echo default arch.conf > \$target
echo console-mode max >> \$target
echo editor no >> \$target

target=/boot/loader/entries/arch.conf
option=\`blkid -o export ${part}2 | grep ^PARTUUID\`
echo title Arch Linux > \$target
echo linux /vmlinuz-linux-zen >> \$target
echo initrd /\${ucode}.img >> \$target
echo initrd /booster-linux-zen.img >> \$target
echo options root=\${option} rw >> \$target

# Enable NOPASSWORD
echo \${user} ALL=\(ALL:ALL\) NOPASSWD: ALL >> /etc/sudoers

# Change User
su - \${user} <<__EOF__

# Download vim-jetpack
curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim

# Install yay & downgrade
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

git clone https://aur.archlinux.org/downgrade.git
cd downgrade
makepkg -si --noconfirm
cd ..
rm -rf downgrade

__EOF__

# Disable NOPASSWORD 
sed -i -e "s/\${user} ALL=(ALL:ALL) NOPASSWD: ALL//" /etc/sudoers

# Setting Display Manager
sed -i -e 's/agreety --cmd \/bin\/sh/tuigreet -t -r --remember-session --asterisks/' /etc/greetd/config.toml

# Enable Service
systemctl enable NetworkManager.service
systemctl enable paccache.timer

_EOF_

chmod +x /mnt/$shfile
arch-chroot /mnt /$shfile

umount -R /mnt
