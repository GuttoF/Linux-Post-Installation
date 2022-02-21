#/bin/bash

cd

# ---------- BASIC ----------

read -p "Do you want to update your system? [y/n]: " up_system
if [ $up_system == "y" ]
then
  sudo apt update && sudo apt upgrade
  sudo apt install -y git vim
else
  echo "Ok"
fi

# ---------- SSH KEYGEN ----------

read -p "Do you want to create a ssh keygen? [y/n]: " keygen
if [ $keygen == "y" ]
then
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
else
  echo "Ok"
fi

# ---------- SNAP ----------

read -p "Do you want to install snap? [y/n]: " inst_snap
if [ $inst_snap == "y" ]
then
  sudo apt install -y snap
  sudo snap install core

else
  echo "SNAP not installed"
fi

# ---------- DOCKER ----------

read -p "Do you want to install docker? [y/n]: " inst_docker
if [ $inst_docker == "y" ]
then
  sudo apt install -y  apt-transport-https ca-certificates curl gnupg lsb-release

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update

  sudo apt install -y docker-ce docker-ce-cli containerd.io

  # post-install
  sudo groupadd docker
  sudo usermod -aG docker $USER
 
else
  echo "Docker not installed"
fi

# ---------- PYENV ----------

read -p "Do you want to install pyenv? [y/n]: " inst_pyenv
if [ $inst_pyenv == "y" ]
then
  sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-dev tree python3-pip

  curl https://pyenv.run | bash

  echo -e '\n export PYENV_ROOT="$HOME/.pyenv"'\
          '\n  export PATH="$PYENV_ROOT/bin:$PATH"'\
          '\n  eval "$(pyenv init --path)"'  >>~/.profile
  

  read -p "Do you use zsh or bash? [zsh/bash]: " shell_used
  if [ $shell_used == "zsh" ]
  then
 echo -e '\n export PYENV_ROOT="$HOME/.pyenv"' \
         '\n export PATH="$PYENV_ROOT/bin:$PATH"' \
         '\n eval "$(pyenv init --path)"' \
         '\n eval "$(pyenv init -)"' \
         '\n eval "$(pyenv virtualenv-init -)"'  >> ~/.zshrc
  else
    echo -e '\n export PYENV_ROOT="$HOME/.pyenv"' \
            '\n export PATH="$PYENV_ROOT/bin:$PATH"' \
            '\n eval "$(pyenv init --path)"' \
            '\n eval "$(pyenv init -)"' \
            '\n eval "$(pyenv virtualenv-init -)"'  >> ~/.bashrc
  fi

else    
  echo "Pyenv not installed"
fi
