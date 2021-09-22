#/bin/bash

cd

# ---------- BASIC ----------

sudo apt update

mkdir -p /home/$USER/Repos

sudo add-apt-repository ppa:alexlarsson/flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo add-apt-repository ppa:webupd8team/terminix

sudo apt update

sudo apt install -y flatpak
sudo apt install -y tilix
sudo apt install -y gnome-software-plugin-flatpak
sudo apt install -y snapd

# ---------- SNAP ----------

sudo snap install core
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install discord
sudo snap install zoom-client
sudo snap install telegram-desktop

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

# ---------- PYENV ----------

sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git python3-dev tree python3-pip

curl https://pyenv.run | bash

echo -e 'if shopt -q login_shell; then' \
      '\n  export PYENV_ROOT="$HOME/.pyenv"' \
      '\n  export PATH="$PYENV_ROOT/bin:$PATH"' \
      '\n eval "$(pyenv init --path)"' \
      '\n eval "$(pyenv init -)"' \
      '\n eval "$(pyenv virtualenv-init -)"' \
      '\nfi' >> ~/.bashrc
echo -e 'if [ -z "$BASH_VERSION" ]; then'\
      '\n  export PYENV_ROOT="$HOME/.pyenv"'\
      '\n  export PATH="$PYENV_ROOT/bin:$PATH"'\
      '\n  eval "$(pyenv init --path)"'\
      '\nfi' >>~/.profile

# ---------- CHANGE TERMINAL ----------      
sudo update-alternatives --config x-terminal-emulator
  