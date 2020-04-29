# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

ZSH_THEME="intheloop"

if [ -e /usr/bin/fortune ] && [ -e /usr/bin/cowsay ]; then
  fortune | cowsay
else
  echo "install fortune and cowsay for fun"
fi

# custom fzf commands
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # laravel
  # docker-compose
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
  fzf # find!
  bgnotify # nofity long task
  sudo # double esc
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

[[ $TERM != "screen" ]] && exec tmux

source $ZSH_CUSTOM/plugins/forgit/forgit.plugin.sh
source $ZSH_CUSTOM/plugins/zsh-interactive/zsh-interactive-cd.plugin.zsh

#general
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file
alias vimrc='${=EDITOR} ~/.vimrc' # Quick access to the ~/.vimrc file
alias ping='prettyping --nolegend'
alias dev="$HOME/dev"
alias du="ncdu -rr -x --color dark --exclude .git --exclude node_modules --exclude-caches"
alias help='tldr'
alias h="history"
alias lsbr="br -dp"

# php
#alias pat="php artisan tinker"
#alias pah="php artisan horizon"
#alias phpunit="vendor/bin/phpunit"
#alias pu="phpunit"
#alias pf="phpunit --filter"

# rails
alias rc='rails console'
alias rs='rails server'
alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'
alias rdr='rake db:rollback'
alias rds='rake db:seed'
alias rdrs='rake db:reset'
alias rr='rake routes'

# adonis
alias ads='adonis serve --dev --debug'
alias adrepl='adonis repl'
alias adt='adonis test -b'
alias admt='adonis migration:run'
alias admtr='adonis migration:rollback'
alias admts='adonis migration:status'
alias adroute='adonis route:list'

# git
alias gfaa="gfa && gco develop && ggpull && gco master && ggpull"
# alias gcupdate="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d"  # TEST delete local branch merged with master
alias gcotop="git checkout $(git log --branches -1 --pretty=format:"%H")" # go to last commit from current branch
alias gsno="git show --name-only"
alias gsta="git stash save --include-untracked"

# remove the commit from branch
alias grhd="git reset HEAD~ --hard"
# undo the last commit, but leave the changes available
alias grs="git reset HEAD~ --soft"

# docker
alias dcdangling="docker rmi \$(docker images -f \"dangling=true\" -q)"

#zsh
alias reload!=". ~/.zshrc"

# exa
alias ls="exa"
alias l="exa -a"
alias ll="exa -lgh"
alias la="exa -lagh"
alias lt="exa -T"
alias lg="exa -lagh --git"

# debian
# alias update="sudo apt update"
# alias upgrade="sudo apt upgrade"
# alias update_upgrade="sudo apt update && sudo apt upgrade"
# alias inst="sudo apt install"

# arch
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syu"
alias inst="sudo pacman -S"
alias clean='sudo pacman -Rs $(pacman -Qdtq)' # removes orphan packages from Archlinux

# file manipulation
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export SMPCPATH=/home/jonaselan/Desktop/setup-my-pc

# use vim for man pages
vman () {
  man $1 | vim -
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
fstash() {
  while out=$(git stash list "$@" |
            fzf --ansi --no-sort --reverse --print-query --query="$query"      \
                --expect=ctrl-m,ctrl-b,del \
                --preview-window=bottom:60% \
                --preview 'git show --patience --stat --pretty=oneline --color=always \
                                -p (echo {} | cut -d: -f1 | less -R)' \
#                                  ^^ dropped quotes and changed $( to ( for fish subshell. ick.
            );
do
    # Tokenize selection by newline
    selection=("${(f)out}")

    # Keep the query accross fzf calls
    query="$selection[1]"

    # Represents the stash, e.g. stash{1}
    reflog_selector=$(echo "$selection[3]" | cut -d ':' -f 1)

    case "$selection[2]" in
        # enter or ctrl-m is just a diff
        ctrl-m)
            git diff --patience --color=always -p "$reflog_selector" | less -R
            ;;
        # ctrl-b checks out the stash as a branch and removes the stash
        ctrl-b)
            sha=$(echo "$selection[3]" | grep -o '[a-f0-9]\{7\}')
            git stash branch "stash-$sha" "$reflog_selector"
            break
            ;;
        # del will drop the stash
        del)
            git stash drop "$reflog_selector"
            ;;
    esac
done
}

# fgsw - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fgsw() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fgc - checkout git commit
fgc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# gbclean Delete any local branches whose remote has been deleted
gbclean() {
  git remote prune origin
  git branch -vv | grep "origin/.*: gone]" | awk '{print $1}' | xargs git branch -D
}

compress() {
  tar cvzf $1.tar.gz $1
}

copy() {
  xclip -sel clip < $1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/$USER/.config/broot/launcher/bash/br

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
