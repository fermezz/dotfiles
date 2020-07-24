#!/bin/bash

function install_package {
  if [[ ${OSTYPE} == "darwin"* ]]; then
    brew install $@
  else
    echo "No package manager was provided for this OS. Packages that won't be installed: ${@}"
  fi
}

# --------------------------------------------------------

echo "Installing Starship..."
(which starship && echo -e "Starship already installed.\n") || (install_package starship && curl echo -e "Done installing Starship.\n")

echo "Installing NeoVim..."
(which nvim && echo -e "NeoVim already installed.\n") || (install_package nvim && echo -e "Done installing NeoVim.\n")

echo "Installing ripgrep..."
(which rg && echo -e "ripgrep already installed.\n") || (install_package ripgrep && echo -e "Done installing ripgrep.\n")

echo "Installing Oh My Zsh..."
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo -e "Done installing Oh My Zsh.\n"
else
  echo -e "Oh My Zsh already installed. Moving on.\n"
fi

echo "Installing virtualenvwrapper..."
(pip3 show --quiet virtualenvwrapper && echo -e "virtualenvwrapper already installed.\n") || (pip3 install virtualenvwrapper && echo -e "Done installing virtualenvwrapper.\n")

echo "Cloning dotfiles into ${HOME}/dotfiles..."
if [[ ! -d $HOME/dotfiles ]]; then
  git clone https://github.com/fermezz/dotfiles $HOME/dotfiles
  echo -e "Done cloning dotfiles.\n"
else
  echo -e "dotfiles already cloned. Moving on.\n"
fi

echo "Cloning z into ${HOME}/z..."
if [[ ! -d $HOME/z ]]; then
  git clone https://github.com/rupa/z $HOME/z
  echo -e "Done cloning z.\n"
else
  echo -e "z already cloned. Moving on.\n"
fi

echo "Setting up .zshrc..."
echo "source ${HOME}/dotfiles/.zshrc" > ${HOME}/.zshrc
echo -e ".zshrc set up.\n"

echo "Setting up .tmux.conf..."
echo "source ${HOME}/dotfiles/.tmux.conf" > ${HOME}/.tmux.conf
echo -e ".tmux.conf set up.\n"

echo "Setting up .vimrc..."
if [[ ! -d ${HOME}/.config/nvim ]]; then
  mkdir -p ${HOME}/.config/nvim
fi
echo "source ${HOME}/dotfiles/.vimrc" > ${HOME}/.config/nvim/init.vim
echo -e ".vimrc set up.\n"

echo "Installing vim-plug..."
if [[ ! -f ${HOME}/.local/share/nvim/site/autoload/plug.vim ]]; then
  sh -c 'curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo -e "Done installing vim-plug.\n"
else
  echo -e "vim-plug already installed. Moving on.\n"
fi

echo "Installing tpm..."
if [[ ! -d ${HOME}/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
  echo -e "Done installing tpm.\n"
else
  echo -e "tpm already installed. Remember to press prefix + I to install the plugins once you're in tmux!. Moving on.\n"
fi
