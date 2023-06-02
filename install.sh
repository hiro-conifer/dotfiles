#!/bin/sh
# Create Symlink
ln -sf ~/dotfiles/config ~/.config
ln -sf ~/dotfiles/local ~/.local
ln -sf ~/dotfiles/Xdefaults ~/.Xdefaults
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Install Wayland
yay -S --noconfirm xorg-xwayland qt5-wayland

# Install lightdm
yay -S --noconfirm lightdm lightdm-webkit2-greeter lightdm-webkit2-theme-glorious
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
sudo sed -i '/debug_mode          = false/s/false/true/' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo systemctl enable lightdm

# Install sway
yay -S --noconfirm swayfx swaylock-fancy swayidle swaybg waybar mako
sudo mv ~/dotfiles/sway.sh /usr/local/bin/
sudo chmod 755 /usr/local/bin/sway.sh
sudo mv ~/dotfiles/sway.desktop /usr/share/wayland-sessions/

# Install fonts
yay -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra otf-font-awesome

# Install Audio
yay -S --noconfirm pipewire wireplumber pipewire-alsa pipewire-pulse pavucontrol playerctl
yay -S --noconfirm brightnessctl

# Install fcitx
yay -S --noconfirm fcitx5-mozc fcitx5-configtool
echo 'GTK_IM_MODULE=fcitx' | sudo tee -a /etc/environment
echo 'QT_IM_MODULE=fcitx' | sudo tee -a /etc/environment
echo 'XMODIFIERS=@im=fcitx' | sudo tee -a /etc/environment

# Install etc
yay -S --noconfirm thunar gvfs network-manager-applet pamac ranger gotop kitty

# Install browser
yay -S --noconfirm vivaldi

# Del Installer
rm -rf ~/dotfiles/yay
