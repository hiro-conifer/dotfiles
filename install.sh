#!/bin/sh
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.local ~/.local
ln -sf ~/dotfiles/.Xdefaults ~/.Xdefaults

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S --noconfirm xorg-xwayland qt5-wayland

yay -S --noconfirm lightdm lightdm-webkit2-greeter lightdm-webkit2-theme-glorious
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
sudo sed -i '/debug_mode          = false/s/false/true/' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo systemctl enable lightdm

yay -S --noconfirm swayfx swaylock-fancy swayidle swaybg waybar mako
sudo mv ~/dotfiles/sway.sh /usr/local/bin/
sudo chmod 755 /usr/local/bin/sway.sh
sudo mv ~/dotfiles/sway.desktop /usr/share/wayland-sessions/

yay -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra otf-font-awesome
yay -S --noconfirm pipewire wireplumber pipewire-alsa pipewire-pulse pavucontrol playerctl
yay -S --noconfirm brightnessctl

yay -S --noconfirm fcitx5-mozc fcitx5-configtool
echo 'GTK_IM_MODULE=fcitx' | sudo tee -a /etc/environment
echo 'QT_IM_MODULE=fcitx' | sudo tee -a /etc/environment
echo 'XMODIFIERS=@im=fcitx' | sudo tee -a /etc/environment

yay -S --noconfirm thunar gvfs network-manager-applet pamac

rm -rf ~/dotfiles/yay
