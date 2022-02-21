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