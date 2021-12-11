#/bin/bash

cd

# ---------- BASIC ----------

sudo apt update
sudo apt upgrade

# ---------- DOCKER ----------

sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io

# post-install
sudo groupadd docker
sudo usermod -aG docker $USER

# ---------- ZSH ----------
sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# ---------- PYENV ----------

sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git python3-dev tree python3-pip

curl https://pyenv.run | bash

echo -e '\n export PYENV_ROOT="$HOME/.pyenv"' \
        '\n export PATH="$PYENV_ROOT/bin:$PATH"' \
        '\n eval "$(pyenv init --path)"' \
        '\n eval "$(pyenv init -)"' \
        '\n eval "$(pyenv virtualenv-init -)"'  >> ~/.zshrc

echo -e '\n export PYENV_ROOT="$HOME/.pyenv"'\
       '\n  export PATH="$PYENV_ROOT/bin:$PATH"'\
       '\n  eval "$(pyenv init --path)"'  >>~/.profile
