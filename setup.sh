# Update our system and repos
sudo apt update
sudo apt upgrade -y

#Copy the start script and keepass db into corresponding folders
cp files/start.sh ~/start.sh
cp files/KeePass_DB.kdbx ~/Documents/KeePass_DB.kdbx

#Enable snap
mv /etc/apt/preferences.d/nosnap.pref ~

#Install snap
sudo apt install -y snapd

#Install keepass, vscodium and netbeans 
sudo snap install keepassxc
sudo snap install codium
sudo snap install netbeans --classic
sudo snap install discord

#Install wget
sudo apt install -y wget apt-transport-https

#Add signal, element, veracrypt and microsoft repositories
sudo add-apt-repository ppa:unit193/encryption
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
‍echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

#Update repos
sudo apt update

#Install element, signal, veracrypt and macchanger, .NET SDK and Veracrypt
sudo apt install -y element-desktop
sudo apt install -y signal-desktop
sudo apt install -y macchanger
sudo apt install -y dotnet-sdk-5.0
sudo apt install -y veracrypt

#Install nginx and php-fpm
sudo apt install -y nginx
sudo apt install -y php7.4-fpm

#Move nginx related files
sudo cp files/default /etc/nginx/sites-available/default
sudo cp files/index.php /var/www/html/index.php
sudo cp files/hosts /etc/hosts

#Restart nginx service
sudo service nginx restart