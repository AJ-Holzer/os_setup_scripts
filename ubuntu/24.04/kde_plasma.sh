#!/usr/bin/env bash
set -euo pipefail

# Update
sudo apt update
sudo apt upgrade

# Install snap and Flatpak
sudo apt install -y snap
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# === Install Drivers ===
echo "Installing drivers..."
sudo ubuntu-drivers install


# === Change Desktop Mode ===
# Change from wayland to x11
if ! grep -q "Session=plasma.desktop" /etc/sddm.conf 2>/dev/null; then
    echo "Switching KDE to X11 session..."
    sudo sddm --example-config > /etc/sddm.conf
    sudo sed -i 's/^Session=.*/Session=plasma.desktop/' /etc/sddm.conf
fi


# === Install programs ===
# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get install spotify-client

# Install Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg;
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
wget -O signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources;
cat signal-desktop.sources | sudo tee /etc/apt/sources.list.d/signal-desktop.sources > /dev/null
sudo apt update && sudo apt install signal-desktop

# Discord
flatpak install -y flathub com.discordapp.Discord

# VS-Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
    sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code
