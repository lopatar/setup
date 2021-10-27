#Turn off the network interface
ifconfig wlp3s0 down
#Change the interface's MAC to a random value
macchanger -r wlp3s0
#Turn on the network interface
ifconfig wlp3s0 up
#Connect to wireguard server
wg quick up contabo
#Clear output
echo Connect to the internet and press any key, system will be updated afterwards.
#Wait for input
read dummy
#Update the system
apt update
apt upgrade -y
