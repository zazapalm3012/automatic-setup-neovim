#!/usr/bin/env bash

echo "Cleaning Neovim setup..."

# 1️⃣ ลบ lazy.nvim bootstrap
LAZY_DIR="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ -d "$LAZY_DIR" ]; then
    echo "Removing lazy.nvim..."
    rm -rf "$LAZY_DIR"
else
    echo "lazy.nvim not found."
fi

# 2️⃣ ลบ plugin ที่ติดตั้งผ่าน lazy.nvim (optional)
PLUGINS_DIR="$HOME/.local/share/nvim/lazy"
if [ -d "$PLUGINS_DIR" ]; then
    echo "Removing all lazy.nvim plugins..."
    rm -rf "$PLUGINS_DIR"
else
    echo "No lazy.nvim plugins found."
fi

# 3️⃣ ลบ cache ของ Neovim (optional)
CACHE_DIR="$HOME/.cache/nvim"
if [ -d "$CACHE_DIR" ]; then
    echo "Removing Neovim cache..."
    rm -rf "$CACHE_DIR"
else
    echo "No Neovim cache found."
fi

echo "Clean finished."

