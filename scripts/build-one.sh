#!/usr/bin/env bash
set -euo pipefail
pkgdir="$1"
arch="${2:-x86_64}"

pushd "$pkgdir"
# clean workspace
rm -f *.pkg.tar.* || true
rm -rf src pkg || true

# build in clean Arch container as non-root
docker run --rm -v "$PWD":/src -w /src archlinux:base-devel bash -lc '
  set -euo pipefail
  pacman -Syu --noconfirm git base-devel
  useradd -m builder
  chown -R builder:builder /src
  sudo -u builder bash -lc "makepkg -sCfr --noconfirm"
'
# emit path(s) to built packages
ls -1 *.pkg.tar.zst | sed "s#^#$(pwd)/#"
popd
