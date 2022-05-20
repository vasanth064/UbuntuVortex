#Installing pre-requtites for External Sources
sudo apt update -y
sudo apt install git curl wget -y

#Requirements for user.sh
#Icons
sudo apt install numix-icon-theme-circle -y
./user.sh

#Adding apt External Sources 
#albert
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_21.10/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_21.10/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"

#vs code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

#edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb


#PPA
#OBS-STUDIO
sudo add-apt-repository ppa:obsproject/obs-studio

sudo apt update -y
sudo apt install preload vlc gimp gparted flatpak gnome-software-plugin-flatpak dconf-editor v4l2loopback-dkms obs-studio scrcpy adb albert code apt-transport-https dkms ttf-mscorefonts-installer rar unrar libavcodec-extra microsoft-edge-stable gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi zsh qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager gnome-shell-extensions chrome-gnome-shell gnome-tweaks -y

#Removing Duplicates form apt Sources
rm -f packages.microsoft.gpg
sudo rm microsoft.gpg
sudo rm -rv /etc/apt/sources.list.d/microsoft-edge-dev.list

#snap Packages
sudo snap install emote
sudo snap install onlyoffice-desktopeditors

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
./postInstall.sh

sudo reboot
