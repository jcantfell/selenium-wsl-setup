#!/bin/bash

# Install zsh
sudo apt install zsh -y
# set Zsh to default shell
chsh -s $(which zsh)
# add Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

user=${whoami}

# Add required zshrc entries
echo "cd ~/repos" | sudo tee -a ~/.zshrc
echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0" | sudo tee -a ~/.zshrc
echo "sudo /etc/init.d/dbus start &> /dev/null" | sudo tee -a ~/.zshrc
echo "$user ALL = (root) NOPASSWD: /etc/init.d/dbus" | sudo tee -a ~/.zshrc

# Install all the things needed for GUI apps
sudo apt install \
  libgtk-3-dev \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 -y

sudo apt install \
  libgstreamer-plugins-bad1.0-0 \
  libenchant1c2a \
  gstreamer1.0-libav -y