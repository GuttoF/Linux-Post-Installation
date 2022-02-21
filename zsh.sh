# ---------- ZSH ----------

read -p "Do you want to use zsh? [y/n]: " inst_zsh
if [ $inst_zsh == "y"]
then
  sudo apt install git
  sudo apt install zsh -y
else
  echo "Ok"
fi

# ---------- OH MY ZSH ----------

read -p "Do you want to install Oh my ZSH? [y/n]: " omzsh
if [$omzsh == "y"]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "Ok"
fi


# ---------- OH MY ZSH ----------

read -p "Do you want to install Spaceship? [y/n]: " spaceship_theme
if [ $spaceship_theme == "y" ]
then
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
  echo "Ok"
fi

# ---------- ZSH EXTENSIONS ----------

read -p "Do you want to install zsh extensions? [y/n]: " extension
if [ $extension == "y" ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

else
  echo "Ok"
fi
