# If you come from bash you might have to change your $PATH.

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Custom lean prompt with git info
ZSH_THEME=""

# Git status function
git_prompt_info() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    local status=""
    
    # Check for changes
    if ! git diff --quiet 2>/dev/null; then
      status="*"
    elif ! git diff --cached --quiet 2>/dev/null; then
      status="+"
    fi
    
    echo " %F{yellow}$branch%f%F{red}$status%f"
  fi
}

# Custom prompt
setopt PROMPT_SUBST
PROMPT='%F{cyan}%1~%f$(git_prompt_info) %F{green}❯%f '

# Which plugins would you like to load?
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# ==================


export PYENV_ROOT="$HOME/.pyenv"
if command -v brew >/dev/null 2>&1; then
    export PATH="$(brew --prefix)/opt/pyenv/bin:$PATH"
    eval "$(pyenv init - zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_edGitLab
ssh-add ~/.ssh/id_ed25519_personalgithub
ssh-add ~/.ssh/id_ed25519Github
ssh-add ~/.ssh/id_ed25519

git config --global core.editor nvim
alias vim="nvim"


# USD runtime environment
export PYTHONPATH="/Users/BECKM104/dev/usd/runtime/lib/python:$PYTHONPATH"
export PATH="/Users/BECKM104/dev/usd/runtime/bin:$PATH"
export PATH=$PATH:./USD-Fileformat-plugins/bin/bin:"/Users/BECKM104/dev/usd/USD-Fileformat-plugins/bin/plugin/usd"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/Users/BECKM104/dev/USD-Fileformat-plugins/bin/lib"
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:"/Users/BECKM104/dev/usd/USD-Fileformat-plugins/bin/lib"
export PXR_PLUGINPATH_NAME=$PXR_PLUGINPATH_NAME:"/Users/BECKM104/dev/usd/USD-Fileformat-plugins/bin/plugin/usd"
export PATH="$HOME/.npm-global/bin:$PATH"
eval "$(/bin/brew shellenv)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
