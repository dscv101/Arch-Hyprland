#!/bin/bash
# 💫 https://github.com/JaKooLit 💫 #
# Compatible dotfiles to download from main #


## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || { echo "${ERROR} Failed to change directory to $PARENT_DIR"; exit 1; }

# Source the global functions script
if ! source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"; then
  echo "Failed to source Global_functions.sh"
  exit 1
fi

# Check if compatible dotfiles exist
printf "${NOTE} Cloning and Installing ${SKY_BLUE}KooL's Compatible Dotfiles${RESET}....\n"
printf "${NOTE} ${YELLOW}Note: These dotfiles contain compatible configurations for waybar, terminal, zsh, etc.${RESET}\n"

if [ -d Hyprland-Dots ]; then
  cd Hyprland-Dots
  git stash && git pull
  chmod +x copy.sh
  ./copy.sh
else
  if git clone --depth=1 https://github.com/JaKooLit/Hyprland-Dots; then
    cd Hyprland-Dots || exit 1
    chmod +x copy.sh
    ./copy.sh
  else
    echo -e "$ERROR Can't download ${YELLOW}KooL's Compatible Dotfiles${RESET} . Check your internet connection"
  fi
fi

printf "\n%.0s" {1..2}