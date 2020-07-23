export ZSH=$HOME/.oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="half-life"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

plugins=(
  git git-flow history node npm kubectl
)

source $ZSH/oh-my-zsh.sh

autoload -U colors
colors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Spaceship config
SPACESHIP_BATTERY_SHOW=charged
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_KUBECONTEXT_SYMBOL="☸️ "
# SPACESHIP_PYENV_SHOW=false
SPACESHIP_TIME_SHOW=true
SPACESHIP_HOST_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false

# Aliases and environment variables
source ${HOME}/dotfiles/.zshrc.aliases
source ${HOME}/dotfiles/.zshrc.envvars

# Jump around with `z`
. $HOME/z/z.sh

# Comment/Uncomment to use pyenv or virtualenvwrapper for Python's virtualenvs.
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
source /usr/bin/virtualenvwrapper_lazy.sh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
# prompt spaceship

fpath+=${ZDOTDIR:-~}/.zsh_functions

source $HOME/.cargo/env

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh
