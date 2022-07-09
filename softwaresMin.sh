#apt Packages
sudo apt update -y
sudo apt install git preload curl wget snapd flatpak gnome-software-plugin-flatpak -y

#flatpak Config
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#snap Packages
sudo snap install core
sudo snap install gh

#Requirements for user.sh
#Icons
sudo apt install numix-icon-theme-circle -y
echo 'y/n) Do you want VsCode'
read script
if [ $vs = 'y' ]
then
#vs code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y
sudo apt install apt-transport-https code -y
fi

echo 'y/n) Do you want Microsoft Edge'
read script
if [ $edge = 'y' ]
then
#edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
rm -f packages.microsoft.gpg
sudo rm microsoft.gpg
sudo rm -rv /etc/apt/sources.list.d/microsoft-edge-dev.list
sudo apt update -y
sudo apt install microsoft-edge-stable -y
fi

sudo apt update -y
sudo apt install preload zsh rofi -y

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

sudo apt update -y
sudo apt auto-remove -y

#config Git
git config --global user.email "vasanthvdev@gmail.com"
git config --global user.name "vasanth064"

./user.sh
echo '----------------Installation Complete----------------'
read
./postInstall.sh

sudo reboot
