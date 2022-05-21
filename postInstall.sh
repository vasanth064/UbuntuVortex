echo '--------------------Post Install---------------------'
echo 'y/n) Setup Scripts at startup'
echo '-----------------------------------------------------'
read script
if [ $script = 'y' ]
then
    echo '---------------Startup Scripts Setup-----------------'
    echo '1) Open a new terminal'
    echo '2) Type $ crontab -e'
    echo '3) Copy the below lines and add it in nano'
    echo ''
    echo '@reboot /home/vasanth/Scripts/organizeDownloads.sh'
    echo '@reboot /home/vasanth/Scripts/organizeDocs.sh'
    echo ''
    echo '4) Save and press ENTER to continue'
    read enter
fi
echo '-----------------------------------------------------'
echo 'y/n) Setup Github SSH'
read gssh
echo '-----------------------------------------------------'
if [ $gssh = 'y' ]
then
    echo '-----------------Github SSH Setup--------------------'
    echo 'Setting up SSH for Github'
    echo '------------Press enter untill Passphrase------------'
    read enter
    echo '-----------------------------------------------------'
    ssh-keygen -t ed25519 -C "vasanthvdev@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    echo '-------Copy the public key in ~/.ssh/id_ed25519------'
    echo ''
    echo '-------------Enter the key in Github SSH-------------'
    read enter
    echo '-----------------------------------------------------'
fi
echo '-----------------------------------------------------'
echo 'y/n) Setup Extension Sync'
read es
echo '-----------------------------------------------------'
if [ $es = 'y' ]
then
    echo '------------------Extension Sync---------------------'
    echo '1) Download Extensions Sync from'
    echo 'https://extensions.gnome.org/'
    read enter
    echo '2) Snippent ID'
    echo '2329526'
    read enter
    echo '3) User Token'
    echo 'glpat-zkcX3TNkuSSbeUZykxF9'
    read enter
    echo '-----------------------------------------------------'
fi
