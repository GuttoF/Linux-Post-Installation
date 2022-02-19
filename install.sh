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

# ---------- OH MY ZSH SPACESHIP ----------

read -p "Do you want to use zsh and spaceship? [y/n]: " inst_zsh
if [ $inst_zsh == "y"]
then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  
  sudo mv 'MesloLGS NF Regular.ttf' /usr/share/fonts
  
  sudo apt install git
  sudo apt install zsh -y

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


  echo -e '\n SPACESHIP_PROMPT_ORDER=(' \
          '\n   time' \
          '\n   user' \
          '\n # host' \
          '\n   dir' \
          '\n   git' \
          '\n   docker' \
          '\n   pyenv' \
          '\n   line_sep' \
          '\n   vi_mode' \
          '\n   char' \
          '\n )' \
          '\n # PROMPT' \
          '\n SPACESHIP_PROMPT_SYMBOL="➜"' \
          '\n SPACESHIP_PROMPT_ADD_NEWLINE=true' \
          '\n SPACESHIP_PROMPT_SEPARATE_LINE=true' \
          '\n SPACESHIP_PROMPT_PREFIXES_SHOW=true' \
          '\n SPACESHIP_PROMPT_SUFFIXES_SHOW=true' \
          '\n SPACESHIP_PROMPT_DEFAULT_PREFIX="via "' \
          '\n SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "' \
          '\n ' \
          '\n # TIME' \
          '\n PACESHIP_TIME_SHOW=false' \
          '\n SPACESHIP_TIME_PREFIX="at "' \
          '\n SPACESHIP_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n SPACESHIP_TIME_FORMAT=false' \
          '\n SPACESHIP_TIME_12HR=false' \
          '\n SPACESHIP_TIME_COLOR="yellow"' \
          '\n ' \
          '\n # USER' \
          '\n SPACESHIP_USER_SHOW=always' \
          '\n SPACESHIP_USER_PREFIX="with "' \
          '\n SPACESHIP_USER_SUFFIX=""' \
          '\n SPACESHIP_USER_COLOR="yellow"' \
          '\n SPACESHIP_USER_COLOR_ROOT="red"' \
          '\n ' \
          '\n # HOST' \
          '\n #SPACESHIP_HOST_SHOW=true' \
          '\n #SPACESHIP_HOST_PREFIX="at "' \
          '\n #SPACESHIP_HOST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n #SPACESHIP_HOST_COLOR="green"' \
          '\n ' \
          '\n # DIR' \
          '\n SPACESHIP_DIR_SHOW=true' \
          '\n SPACESHIP_DIR_PREFIX=" in dir "' \
          '\n SPACESHIP_DIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n SPACESHIP_DIR_TRUNC=3' \
          '\n SPACESHIP_DIR_COLOR="cyan"' \
          '\n ' \
          '\n # GIT' \
          '\n SPACESHIP_GIT_SHOW=true' \
          '\n SPACESHIP_GIT_PREFIX="on "' \
          '\n SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n SPACESHIP_GIT_SYMBOL=" "' \
          '\n ' \
          '\n # GIT BRANCH' \
          '\n SPACESHIP_GIT_BRANCH_SHOW=true' \
          '\n SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"' \
          '\n SPACESHIP_GIT_BRANCH_SUFFIX=""' \
          '\n SPACESHIP_GIT_BRANCH_COLOR="magenta"' \
          '\n ' \
          '\n # GIT STATUS' \
          '\n SPACESHIP_GIT_STATUS_SHOW=true' \
          '\n SPACESHIP_GIT_STATUS_PREFIX=" ["' \
          '\n SPACESHIP_GIT_STATUS_SUFFIX="]"' \
          '\n SPACESHIP_GIT_STATUS_COLOR="red"' \
          '\n SPACESHIP_GIT_STATUS_UNTRACKED="?"' \
          '\n SPACESHIP_GIT_STATUS_ADDED="+"' \
          '\n SPACESHIP_GIT_STATUS_MODIFIED="!"' \
          '\n SPACESHIP_GIT_STATUS_RENAMED="»"' \
          '\n SPACESHIP_GIT_STATUS_DELETED="✘"' \
          '\n SPACESHIP_GIT_STATUS_STASHED="$"' \
          '\n SPACESHIP_GIT_STATUS_UNMERGED="="' \
          '\n SPACESHIP_GIT_STATUS_AHEAD="⇡"' \
          '\n SPACESHIP_GIT_STATUS_BEHIND="⇣"' \
          '\n SPACESHIP_GIT_STATUS_DIVERGED="⇕"' \
          '\n ' \
          '\n # DOCKER' \
          '\n SPACESHIP_DOCKER_SHOW=true' \
          '\n SPACESHIP_DOCKER_PREFIX="on "' \
          '\n SPACESHIP_DOCKER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n SPACESHIP_DOCKER_SYMBOL="🐳 "' \
          '\n SPACESHIP_DOCKER_COLOR="cyan"' \
          '\n ' \
          '\n # PYENV' \
          '\n SPACESHIP_PYENV_SHOW=true' \
          '\n SPACESHIP_PYENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"' \
          '\n SPACESHIP_PYENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n SPACESHIP_PYENV_SYMBOL="🐍 "' \
          '\n SPACESHIP_PYENV_COLOR="yellow"' \
          '\n ' \
          '\n # VI_MODE' \
          '\n SPACESHIP_VI_MODE_SHOW=true' \
          '\n SPACESHIP_VI_MODE_PREFIX=""' \
          '\n SPACESHIP_VI_MODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"' \
          '\n SPACESHIP_VI_MODE_INSERT="[I]"' \
          '\n SPACESHIP_VI_MODE_NORMAL="[N]"' \
          '\n SPACESHIP_VI_MODE_COLOR="white"' \ >> ~/.zshrc
  echo "You'll need to change the zsh theme in .zshrc to ZSH_THEME='spaceship' and change your terminal's font to MESLOLGS"
else
  echo "Ok, zsh will not install"

# ---------- ZSH EXTENSIONS ----------

read -p "Do you want to install zsh extensions? [y/n]: " extension
if [ $extension == "y" ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

else
  echo "Ok"

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
