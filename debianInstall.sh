#!/bin/bash

# Update
sudo apt update

# Install Snap
sudo apt install snapd -y


# Install basic programs
sudo apt install git -y                                                                            # Git
sudo snap install --classic code                                                                   # VSCode
sudo snap install opera                                                                            # Opera
sudo snap install bitwarden                                                                        # BitWarden
sudo snap install discord                                                                          # Discord
curl -fsSL https://ollama.com/install.sh | sh                                                      # Ollama
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"  # Vencord


# Programming languages
sudo apt install python3      # Python
sudo apt install python3-pip  # Python (PIP)