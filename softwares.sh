#Installing pre-requtites for External Sources
sudo apt update -y

sudo apt update -y
sudo apt install preload vlc gimp gparted flatpak gnome-software-plugin-flatpak dconf-editor v4l2loopback-dkms obs-studio scrcpy adb albert code apt-transport-https dkms rar unrar libavcodec-extra microsoft-edge-stable gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi zsh qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager gnome-shell-extensions chrome-gnome-shell gnome-tweaks -y

#Removing Duplicates form apt Sources
rm -f packages.microsoft.gpg
sudo rm microsoft.gpg
sudo rm -rv /etc/apt/sources.list.d/microsoft-edge-dev.list


#flatpak Packages
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.nomacs.ImageLounge -y #Image Viewer (Frameless)
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub io.bassi.Amberol -y #Music Player
flatpak install flathub com.mattjakeman.ExtensionManager -y 
flatpak install flathub io.github.Figma_Linux.figma_linux -y
flatpak install flathub io.github.shiftey.Desktop -y

#Install and configure Virtual Manager
sudo virsh net-start default
sudo virsh net-autostart default
sudo adduser vasanth libvirt
sudo adduser vasanth libvirt-qemu

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

sudo apt update -y
sudo apt upgrade -y
sudo apt auto-remove -y

#config Git
git config --global user.email "vasanthvdev@gmail.com"
git config --global user.name "vasanth064"

#config GRUB
cp -vr ./Configs/dracula /usr/share/grub/themes/
cp -vr ./Configs/grub /etc/default/
sudo update-grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo '----------------Installation Complete----------------'
read


sudo reboot
