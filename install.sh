#/bin/bash

cd

# ---------- BASIC ----------

read -p "Do you want to update your system? [y/n]: " up_system
if [ $up_system == "y" ]
then
  sudo apt update && sudo apt upgrade

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
  sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update

  sudo apt install docker-ce docker-ce-cli containerd.io

  # post-install
  sudo groupadd docker
  sudo usermod -aG docker $USER
 
else
  echo "Docker not installed"
fi

# ---------- PYENV ----------

read -p "Do you want to install pynv? [y/n]: " inst_pyenv
if [ $inst_pyenv == "y"]
then
  sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git python3-dev tree python3-pip

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

else
  echo "Pyenv not installed"
fiecho -e '\n export PYENV_ROOT="$HOME/.pyenv"' \
        '\n export PATH="$PYENV_ROOT/bin:$PATH"' \
        '\n eval "$(pyenv init --path)"' \
        '\n eval "$(pyenv init -)"' \
        '\n eval "$(pyenv virtualenv-init -)"'  >> ~/.bashrc

