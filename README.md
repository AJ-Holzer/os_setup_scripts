# OS Setup Scripts

| File                                                                                                             | OS         | Included                                                            |
| ---------------------------------------------------------------------------------------------------------------- | ---------- | ------------------------------------------------------------------- |
| [ubuntu/24.04/kde_plasma.sh](https://github.com/AJ-Holzer/os_setup_scripts/blob/main/ubuntu/24.04/kde_plasma.sh) | KDE Plasma | - Wayland -> X11<br>- Signal<br>- Discord<br>- Spotify<br>- VS-Code |

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

Verify that the output hash matches this SHA-256 hash: `b752c5dc431244440cf76a1e75eaed55d16efa2e17e73ebf5979e5104bcda7b5`

#### Start Setup

```shell
# Make executable
sudo chmod +x kde_plasma.sh

# Start setup
sudo bash kde_plasma.sh
```
