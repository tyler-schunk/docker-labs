RED="\033[0;32m"
NC="\033[0m" # No Color

### Instructions ###
echo -e "${RED}
#######################################################
#######################################################
###### If prompted, hit enter to apply defaults #######
#######################################################
#######################################################
${NC}";

sleep 5s;


### Update and upgrade packages ###
echo -e "${RED}### Update and upgrade packages ###${NC}";
apt update && apt upgrade -y;

#######################################################

### Install Firefox | create desktop shortcut ###
if ! command -v firefox &> /dev/null; then
  echo -e "${RED}### Install Firefox & create desktop icon ###${NC}";
  sleep 5s;
  sudo install -d -m 0755 /etc/apt/keyrings;
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null;
  echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
  sudo apt update && sudo apt install firefox -y;
  
  # Find the Firefox executable path
  firefox_path=$(which firefox)
  
  # Create the desktop file
  echo "[Desktop Entry]
  Type=Application
  Name=Firefox
  Exec=$firefox_path %U
  Icon=firefox
  Terminal=false
  Categories=Application;Internet;" > ~/Desktop/firefox.desktop;
  
  # Make the file executable
  chmod +x ~/Desktop/firefox.desktop
else
  echo "Firefox is already installed"
fi
#######################################################

### Install Kali metapackages | web ###
# echo -e "${RED}### Install Kali metapackages | web ###${NC}";
# sleep 5s;
# apt install kali-tools-web -y;


### Install custom tools ###
echo -e "${RED}### Install custom tools ###
gobsuter | burpsuite${NC}";
sleep 5s;
apt install -y gobuster burpsuite;
