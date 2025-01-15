#!/bin/bash

PACMAN_PACKAGES=(
    git
    scrot
    wezterm
    firefox
    rofi
    polybar
    picom
    feh
    ttf-firacode-nerd
    man-db
    man-pages
    xclip
    brightnessctl
    zed
)

YAY_PACKAGES=(
    tintin
)

# Exit on errors
set -e

# Script must be run as root or with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Use sudo."
    exit 1
fi

# Install yay if not installed
if ! command -v yay &>/dev/null; then
    # Install dependencies required for building yay
    pacman -S --noconfirm --needed git base-devel

    # Clone yay repository
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp_dir/yay"
    cd "$tmp_dir/yay"

    # Build and install yay
    makepkg -si --noconfirm

    # Clean up temporary directory
    cd ~
    rm -rf "$tmp_dir"
fi

# Install pacman packages
for package in "${PACMAN_PACKAGES[@]}"; do
    if ! pacman -Qi "$package" &>/dev/null; then
        if ! pacman -S --noconfirm --needed "$package"; then
            exit 1
        fi
    fi
done

# Install yay packages
for package in "${YAY_PACKAGES[@]}"; do
    if ! pacman -Qi "$package" &>/dev/null || yay -Qm "$package" &>/dev/null; then
        if ! yay -S --noconfirm --needed "$package"; then
            exit 1
        fi
    fi
done
