export ZSH=/Users/fmezzabotta/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git git-flow history node npm kubectl
)

source $ZSH/oh-my-zsh.sh

autoload -U colors
colors

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tmux="TERM=screen-256color-bce tmux"
alias e="exit"

# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!tags/*"'
export FZF_DEFAULT_OPTS='--height 25%'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Spaceship config
SPACESHIP_BATTERY_SHOW=charged
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_KUBECONTEXT_SYMBOL="☸️ "
SPACESHIP_PYENV_SHOW=false
SPACESHIP_TIME_SHOW=true
SPACESHIP_HOST_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false

# eventbrite exports
export EB_HOME=/Users/fmezzabotta/eventbrite
export BAY_HOME=/Users/fmezzabotta/eventbrite/docker-dev
export ARCANIST_INSTALL_DIR=/Users/fmezzabotta/.evbdevtools
source $ARCANIST_INSTALL_DIR/devtools/scripts/devenv_bash/arcanist_helpers.sh
export INVOKE_RELEASE_EDITOR=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

# tabtab source for jhipster package
# uninstall by removing these lines or running `tabtab uninstall jhipster`
[[ -f /Users/fmezzabotta/dev/aatherapy-2.0/node_modules/tabtab/.completions/jhipster.zsh ]] && . /Users/fmezzabotta/dev/aatherapy-2.0/node_modules/tabtab/.completions/jhipster.zsh

# Jump around with `z`
. $HOME/z/z.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

# Alias for tmux most used sessions.
alias aat="tmux a -t aat"
# alias core="tmux a -t core"
alias ras="tmux a -t ras"

# Eventbrite alias
alias pulleb="pushd $EB_HOME && (update_eb_repos -f) && popd"
alias yak="TERM=xterm-256color yak"
alias devenv="kubectx devenv"

alias sed="gsed"
alias dstopall="docker ps -q | xargs docker stop"

# Locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


alias delete_local_branches="git branch | awk '{for (i = 1; i <= NF; i++){if (\$i != \"master\" && \$i != \"*\") {print \$i}}}' | xargs git branch -D"
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"
alias kgsecrets="kubectl get secrets"

fpath+=${ZDOTDIR:-~}/.zsh_functions


function bay() {
    if [[ $1 == "mounts" ]]; then
        if [[ $# == 1 ]]; then
            command bay mounts
        fi
        if [[ $# == 2 ]]; then
            cmd="bay mounts | grep -B 1 '^Mounted.*$2'"
            eval result=\`${cmd}\`
            echo $result
        fi
        if [[ $# > 2 ]]; then
           echo "Oops! Too many arguments"
           exit 1
       fi
    else
        command bay "$@"
    fi
  }

function tmux_session() {
  command tmux a -t core 2>/dev/null
  if [[ $? -ne 0 ]]; then
    command tmux new -s core
  fi
}
