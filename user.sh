#Copy Login and Desktop Wallpaper
sudo cp -rv ./vortexWallpapers /usr/share/backgrounds/

#Fonts
cp -rv ./.fonts ~/

#Themes
cp -rv ./.themes ~/

#Scripts
cp -rv ./Scripts ~/

#Local
cp -rv ./.local ~/

cd ~
mkdir Projects
git clone git@github.com:vasanth064/dotfiles.git $HOME/Projects/dotfiles --bare
alias config='/usr/bin/git --git-dir=$HOME/Projects/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout

#Set Application theme and Icon Pack
gsettings set org.gnome.desktop.interface gtk-theme "macosDark"
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

#Set Font Preferences
gsettings set org.gnome.desktop.interface font-name 'Poppins 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Poppins Bold 11'

#Set Wallpaper
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/vortexWallpapers/desktopWallpaperFlliped.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/vortexWallpapers/loginWallpaper.jpg'

#Top bar and Title bar Preferences
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize:appmenu'

#SHELL Preferences
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell favorite-apps "['code.desktop', 'org.gnome.Nautilus.desktop', 'microsoft-edge.desktop', 'msedge-cnmnfnkedfekfidgojcdmndbcipagogc-Default.desktop', 'org.gnome.Terminal.desktop']"

gsettings set org.gnome.shell disabled-extensions "['apps-menu@gnome-shell-extensions.gcampax.github.com', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'windowsNavigator@gnome-shell-extensions.gcampax.github.com']"

gsettings set org.gnome.shell enabled-extensions "['floating-dock@nandoferreira_prof@hotmail.com', 'gsconnect@andyholmes.github.io', 'blur-my-shell@aunetx', 'noannoyance@daase.net', 'caffeine@patapon.info', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'just-perfection-desktop@just-perfection', 'hidetopbar@mathieu.bidon.ca', 'CoverflowAltTab@palatis.blogspot.com', 'extensions-sync@elhan.io']"

#Config Gnome Terminal
dconf load /org/gnome/terminal/legacy/keybindings/ < ./Configs/terminalKeys.dconf
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < ./Configs/terminalConfig.dconf

#Config ZSH
sudo usermod -s /usr/bin/zsh $(whoami)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/powerlevel10k
exec zsh

p10k configure