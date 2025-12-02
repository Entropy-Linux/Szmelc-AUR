# Szmelc-AUR
Szmelc Arch repository for pacman

---

# Setup
## One-liner command
```bash
echo -e "[szmelc]\nSigLevel = Optional TrustAll\nServer = https://packages.szmelc.com/x86_64" | sudo tee -a /etc/pacman.conf >/dev/null && sudo pacman -Sy && sudo pacman -Sl szmelc
```

## Script
```bash
#!/bin/bash
[ "$EUID" -ne 0 ] && exec sudo "$0"

cat >> /etc/pacman.conf <<EOF

[szmelc]
SigLevel = Optional TrustAll
Server = https://packages.szmelc.com/x86_64
EOF

pacman -Sy
pacman -Sl szmelc
```
