#! /bin/bash

echo "" >> "$HOME/.bashrc" 
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo ""
echo "eval \"\$(starship init bash)\"" >> "$HOME/.bashrc" 
echo ""

sudo apt update -y
sudo apt upgrade -y

pip install jupyter
pip install pandas