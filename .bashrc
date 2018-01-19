# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions

# extract the current branch name
function current_git_branch {
    branch=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo ${branch#refs/heads/}
}

function cmdline_current_git_branch {
    branch=$(current_git_branch) || return
    echo "("${branch#refs/heads/}")"
}

RED='\e[0;31m'        # Red
GREEN='\e[0;32m'      # Green
YELLOW='\e[0;33m'     # Yellow
BLUE='\e[0;34m'       # Blue
PURPLE='\e[38;5;135m' # Purple
PURPLE='\e[0;35m'     # Purple
CYAN='\e[0;36m'       # Cyan
WHITE='\e[0;37m'      # White

# Prompt color scheme
export PS1="\[$WHITE\][\[$PURPLE\]\$(cmdline_current_git_branch)\[$CYAN\]\w\[$WHITE\]]\$ "

# ls colors
LS_COLORS='di=1;34' ; export LS_COLORS

# Aliases - Global
alias ls="ls -a --color"

# Git Helpers
function pull {
    git pull origin $(current_git_branch)
}

function push {
    git push origin $(current_git_branch)
}

function force-push {
    git push origin $(current_git_branch) --force
}
