# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="intheloop" #spaceship

SPACESHIP_PHP_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false
 
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # laravel
  # docker-compose
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
  # autojump
  fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#general
alias cat="bat"
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

# php
alias pat="php artisan tinker"
alias pah="php artisan horizon"
#alias phpunit="vendor/bin/phpunit"
#alias pu="phpunit"
#alias pf="phpunit --filter"

# git
alias gfaa="gfa && gco develop && ggpull && gco master && ggpull"
# remove the commit from branch
alias grhd="git reset HEAD~ --hard"
# undo the last commit, but leave the changes available
alias grs="git reset HEAD~ --soft"


#zsh
alias reload!=". ~/.zshrc"

# exa
alias ls="exa"
alias l="exa -a"
alias ll="exa -lgh"
alias la="exa -lagh"
alias lt="exa -T"
alias lg="exa -lagh --git"

# ubuntu
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias update_upgrade="sudo apt update && sudo apt upgrade"
