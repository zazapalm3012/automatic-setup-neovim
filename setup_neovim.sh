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
