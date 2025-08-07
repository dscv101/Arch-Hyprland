#!/bin/bash
# 💫 https://github.com/JaKooLit 💫 #
# Main Niri Package #

niri_eco=(
  swayidle
  swaylock
  swaybg
  xwayland-satellite
)

niri=(
  niri
)

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

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_niri.log"

# Check if Niri is installed
if command -v niri >/dev/null 2>&1; then
  printf "$NOTE - ${YELLOW} Niri is already installed.${RESET} No action required.\n"
else
  printf "$INFO - Niri not found. ${SKY_BLUE} Installing Niri...${RESET}\n"
  for NIRI in "${niri[@]}"; do
    install_package "$NIRI" "$LOG"
  done
fi

# Niri ecosystem packages
printf "${NOTE} - Installing ${SKY_BLUE}other Niri ecosystem packages${RESET} .......\n"
for NIRI_PKG in "${niri_eco[@]}"; do
  if ! command -v "$NIRI_PKG" >/dev/null 2>&1; then
    printf "$INFO - ${YELLOW}$NIRI_PKG${RESET} not found. Installing ${YELLOW}$NIRI_PKG...${RESET}\n"
    install_package "$NIRI_PKG" "$LOG"
  else
    printf "$NOTE - ${YELLOW} $NIRI_PKG is already installed.${RESET} No action required.\n"
  fi
done

printf "\n%.0s" {1..2}