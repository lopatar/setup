#Turn off the network interface
sudo ifconfig wlp3s0 down
#Change the interface's MAC to a random value
sudo macchanger -r wlp3s0
#Turn on the network interface
sudo ifconfig wlp3s0 up
#Connect to wireguard server
sudo wg quick up contabo
#Clear output
clear
echo Connect to the internet and press ENTER, system will be updated afterwards.
#Wait for input
read dummy
#Update the system
sudo apt update
sudo apt upgrade -y
