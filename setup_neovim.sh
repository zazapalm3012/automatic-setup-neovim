#!/bin/bash

install_Neovim(){
  local pkg_manager =""
  if command -v apt > /dev/null 2>&1; then
    pkg_manager = "apt"
  elif command -v pacman > /dev/null 2>&1; then
    pkg_manager = "pacman"
  fi

  if command -v nvim > /dev/null 2>&1; then
    echo "Neovim is already installed."
    echo "Version: $(nvim --version | head -n 1 | cut -d ' ' -f 2)"
    return 0
  fi

  case "$pkg_manager" in
    "apt")
        echo "Installing Neovim on Debian/Ubuntu..."
        sudo apt update && sudo apt install -y neovim
        ;;
    "pacman")
        echo "Installing Neovim on Arch Linux..."
        sudo pacman -S --noconfirm neovim
        ;;
    *)
      echo "Please Install your Neovim manully!!"
      return 1
      ;;
    esac

    if command -v nvim >/dev/null 2>&1; then
        echo "✅ Neovim has been successfully installed."
        nvim -v
    else
        echo "❌ An error occurred during the installation."
    fi
}
import_config(){
  if [ -d "$HOME/.config/nvim" ]; then
    echo "You already have config file."
  else
    mkdir -p "$HOME/.config/nvim"
    cp "$HOME/automatic-setup-neovim/init.lua" "$HOME/.config/nvim/"  
    sudo pacman -S nodejs npm
    echo "Installed your neovim is ready to use."
  fi
}

while true;
do
  echo "1.Install Neovim
  2.Import a config
  3.Exit"
  read choice
  if [ "$choice" == '1' ]; then
    install_Neovim
  elif [ "$choice" == '2' ]; then
    import_config
  else
    break
  fi
done
