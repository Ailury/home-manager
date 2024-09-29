#!/bin/bash

FONT_DIR="$HOME/.local/share/fonts"
FONT_DIR="/usr/share/fonts"

mkdir -p "$FONT_DIR"

fonts=(
    "JetBrainsMono"
)

install_fonts() {
    for font in "${fonts[@]}"; do
        echo "Downloading $font Nerd Font..."
        wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.zip" -O "$font.zip"

        echo "Unzipping $font Nerd Font..."
        unzip -q "$font.zip" -d "$FONT_DIR"

        echo "Removing zip file..."
        rm "$font.zip"
    done
}

install_powerlevel10k_fonts() {
    echo "Downloading MesloLGS NF font for Powerlevel10k..."
    wget -q --show-progress "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf" -O "$FONT_DIR/MesloLGS_NF_Regular.ttf"
    wget -q --show-progress "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf" -O "$FONT_DIR/MesloLGS_NF_Bold.ttf"
    wget -q --show-progress "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf" -O "$FONT_DIR/MesloLGS_NF_Italic.ttf"
    wget -q --show-progress "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf" -O "$FONT_DIR/MesloLGS_NF_Bold_Italic.ttf"
}

install_fonts
install_powerlevel10k_fonts

echo "Updating font cache..."
fc-cache -fv

echo "Nerd Fonts and Powerlevel10k fonts installed successfully!"
