# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER=`whoami`
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

# Zsh, Tmux, Vim, and 256 Color Madness
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Node path fix
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules

if [[ `uname` == 'Linux' ]] then

  # Autojump
  . /etc/profile.d/autojump.sh
fi
if [[ `uname` == 'Darwin' ]] then

  # Autojump
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

  # UTF8
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8

  # rbenv
  # eval "$(rbenv init -)"

  # nvm
  # export NVM_DIR="$HOME/.nvm"
  # \. "$NVM_DIR/nvm.sh" # This loads nvm
fi

# Android development
# androidinstall app-debug && androidrun com.example.app MainActivity
function androidinstall(){
  adb install -r ./bin/$1.apk
}
function androidrun(){
  ant clean debug
  adb shell am start -n $1/$1.$2
}

alias markright="open -a /Applications/MarkRight.app"

# tmux
source ~/.zprofile

alias vim="nice -9 nvim"
alias notes="cd ~/Notes && nice -9 nvim"
# echo 1 & [ -s "$NVM_DIR/bash_completion" ] & \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"

# KeyRepeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
