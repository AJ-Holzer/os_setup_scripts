# OS Setup Scripts

| File                                                                                                             | OS         | Included                                                                                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [ubuntu/24.04/kde_plasma.sh](https://github.com/AJ-Holzer/os_setup_scripts/blob/main/ubuntu/24.04/kde_plasma.sh) | KDE Plasma | **Desktop:**<br>- Wayland ⮕ X11<br><br>**Programs:**<br>- Signal<br>- Discord<br>- Spotify<br>- VS-Code<br>- Brave<br><br>**Shortcuts:**<br>- Shortcuts will be replaced |

## KDE Plasma

### Included

### Installation

#### Download and Verify

```shell
# Download
curl -fsSL "https://raw.githubusercontent.com/AJ-Holzer/os_setup_scripts/refs/heads/main/ubuntu/24.04/kde_plasma.sh" -o kde_plasma.sh

# Verify hash
sha256sum kde_plasma.sh
```

Verify that the output hash matches this SHA-256 hash: `5118a1bc20742a24ab2ecfaaf58925f85ae816e88073370e88f473bd6cb63e81`

#### Start Setup

```shell
# Make executable
sudo chmod +x kde_plasma.sh

# Start setup
sudo bash kde_plasma.sh
```
