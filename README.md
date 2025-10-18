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

Verify that the output hash matches this SHA-256 hash: `a1ce981f7dc32dc17c43040c7c67867fe5636c16e2eea70c55f3b499698c952b`

#### Start Setup

```shell
# Make executable
sudo chmod +x kde_plasma.sh

# Start setup
sudo bash kde_plasma.sh
```
