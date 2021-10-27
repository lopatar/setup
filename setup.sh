# Update our system and repos
apt update
apt upgrade -y

#Copy the starting script to our home directory
cp files/start.sh ~/start.sh

#enable snap
mv /etc/apt/preferences.d/nosnap.pref ~

#Install snap
apt install -y snapd

#Install keepass and vscodium
snap install keepassxc
snap install codium

#Install wget
apt install -y wget apt-transport-https

#Add signal, element and microsoft repositories
get -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
‍echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  tee -a /etc/apt/sources.list.d/signal-xenial.list
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

#Update repos
apt update

#Install element, signal and macchanger and .NET SDK
apt install -y element-desktop
apt install -y signal-desktop
apt install -y macchanger
apt install -y dotnet-sdk-5.0



