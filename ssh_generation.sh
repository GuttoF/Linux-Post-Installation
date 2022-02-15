#/bin/bash

cd

read -p "What's your git username? " username
read -p "and what is your email? " email

git config --global user.name "$username"
git config --global user.email "$email"

ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "$email"
cat ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add

