#apt Packages
sudo apt update -y
sudo apt install git preload curl wget -y

#edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'

#vs code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt update -y
sudo apt install apt-transport-https code microsoft-edge-stable -y

#Removing Duplicates form apt Sources
rm -f packages.microsoft.gpg
sudo rm microsoft.gpg
sudo rm -rv /etc/apt/sources.list.d/microsoft-edge-dev.list

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

sudo apt update -y
sudo apt auto-remove -y

#config Git
git config --global user.email "vasanthvdev@gmail.com"
git config --global user.name "vasanth064"

./cleanDebian.sh
sudo reboot
