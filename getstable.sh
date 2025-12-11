#!/usr/bin/env bash
if test -z "$1"; then
    version="0.11.5"
else
    version="$1"
fi
which wget || sudo apt install wget
rm -f nvim-linux-x86_64.tar.gz
wget https://github.com/neovim/neovim/releases/download/v$version/nvim-linux-x86_64.tar.gz
sudo tar xzf nvim-linux-x86_64.tar.gz -C /opt
grep -q "\$PATH:/opt/nvim-linux-x86_64/bin" ~/.bashrc || echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc

