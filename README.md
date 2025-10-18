# OS Setup Scripts

| File                         | OS         | Included | SHA-256 |
| ---------------------------- | ---------- | -------- | ------- |
| [kde_plasma.sh](#kde-plasma) | KDE Plasma | --       | --      |

## KDE Plasma

### Included

### Installation

#### Download and Verify

```shell
# Download
curl -fsSL "https://raw.githubusercontent.com/AJ-Holzer/os_setup_scripts/refs/heads/main/kde_plasma.sh" -o kde_plasma.sh

# Verify hash
sha256sum kde_plasma.sh
```

Verify if the SHA-256 hash matches the above one.

#### Start Setup

```shell
# Make executable
sudo chmod +x kde_plasma.sh

# Start setup
bash kde_plasma.sh
```
