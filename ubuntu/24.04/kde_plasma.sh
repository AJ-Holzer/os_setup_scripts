#!/usr/bin/env bash

# Request permissions
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

set -euo pipefail

# Update
apt update

# Install snap and Flatpak
echo "🟢 Installing Snap..."
apt install -y snapd
echo "🟢 Installing Flatpak..."
apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# === Install Drivers ===
echo "🟢 Installing drivers..."
ubuntu-drivers install


# === Change Desktop Mode ===
# Change from wayland to x11
if ! grep -q "Session=plasma.desktop" /etc/sddm.conf 2>/dev/null; then
    echo "🟢 Switching KDE to X11 session..."
    sddm --example-config > /etc/sddm.conf
    sed -i 's/^Session=.*/Session=plasma.desktop/' /etc/sddm.conf
fi


# === Install programs ===
# Install Spotify
echo "🟢 Installing Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt update
apt-get install spotify-client
spotify
read -n 1 -s -r -p "🟠 Please login to spotify and press any key to continue..."

# Install Signal
echo "🟢 Installing Signal..."
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg;
cat signal-desktop-keyring.gpg | tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
wget -O signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources;
cat signal-desktop.sources | tee /etc/apt/sources.list.d/signal-desktop.sources > /dev/null
apt update
apt install signal-desktop

# Discord
flatpak install -y flathub com.discordapp.Discord

# VSCode
echo "🟢 Installing VSCode..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /usr/share/keyrings/microsoft.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
    tee /etc/apt/sources.list.d/vscode.list
apt update
apt install -y code

# Brave
echo "🟢 Installing Brave..."
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | \
    tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install -y brave-browser


# === Shortcuts ===
# Back up shortcut file
echo "🟢 Backing up global shortcuts..."
mkdir -p ~/.config/backup_shortcuts
cp ~/.config/kglobalshortcutsrc ~/.config/backup_shortcuts/kglobalshortcutsrc.bak

# Import shortcuts
echo "🟢 Overwriting global shortcuts..."
curl -sS "https://raw.githubusercontent.com/AJ-Holzer/os_setup_scripts/refs/heads/main/ubuntu/24.04/shortcut_config.kksrc" > ~/.config/kglobalshortcutsrc


