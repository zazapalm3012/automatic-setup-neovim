#!/bin/bash

echo "What is your based system."
echo "1.Debian 
2 Arch"
read based
if [ "$based" == 1 ]; then
  echo $based
else
  if ! which nvim > /dev/null 2>&1; then
    echo "Not have Nvim in this machine"
    sudo pacman -S neovim
  else
    nvim -v
  fi
fi
echo "Do you want a config? [y/N]"
read ans_config
if [ "$ans_config" == "y" ]; then
 if [ -d "$HOME/.config/nvim" ]; then
   echo "Done"
 else
   mkdir -p "$HOME/.config/nvim"
   cp "$HOME/automatic-setup-neovim/init.lua" "$HOME/.config/nvim/"  
   sudo pacman -S nodejs npm
   echo "Installed your neovim is ready to use."
  fi
fi

