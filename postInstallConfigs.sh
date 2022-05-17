echo '1 - Setting Up Scripts to Startup'
echo '1) Open a new terminal'
echo '2) Type $ crontab -e'
echo '3) Copy the below lines and add it in nano'
echo ''
echo '@reboot /home/vasanth/Scripts/organizeDownloads.sh'
echo '@reboot /home/vasanth/Scripts/organizeDocs.sh'
echo ''
echo '4) Save and press ENTER to continue'
read

echo '2 - Setting up SSH for Github'
echo 'Enter Github E-mail'
read email
ssh-keygen -t ed25519 -C "$email"
echo '-----Press enter untill passphrase'
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo '-----Copy the public key in ~/.ssh/id_ed25519'
echo '-----Enter the key in Github SSH'
