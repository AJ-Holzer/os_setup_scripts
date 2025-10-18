#!/usr/bin/env bash
set -euo pipefail

# Update
sudo apt update
sudo apt upgrade

# Install snap and Flatpak
sudo apt install snap
sudo apt install flatpak

# Install programs
if ! grep -q "Session=plasma.desktop" /etc/sddm.conf 2>/dev/null; then
  echo "Switching KDE to X11 session..."
  sudo sddm --example-config > /etc/sddm.conf
  sudo sed -i 's/^Session=.*/Session=plasma.desktop/' /etc/sddm.conf
fi
