# Szmelc-AUR
Szmelc Arch repository for pacman

## Add Szmelc repo
```bash
sudo -s
cat > /tmp/szmelc-aur.conf <<EOF

[szmelc]
SigLevel = Optional TrustAll
Server = https://packages.szmelc.com/x86_64
EOF

cat /tmp/szmelc-aur.conf >> /etc/pacman.conf
rm /tmp/szmelc-aur.conf
pacman -Sy
pacman -Sl szmelc
exit
```
