################################################
# Add the following code to your ~/.zshrc file #
#                                              #
# if [ -f ~/dotfiles/.zshrc]; then             #
#     source ~/dotfiles/.zshrc                 #
# fi                                           #
################################################

# Extract the current branch name
function current_git_branch {
    branch=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo ${branch#refs/heads/}
}
function cmdline_current_git_branch {
    branch=$(current_git_branch) || return
    echo "("${branch#refs/heads/}")"
}

# Color definitions
RED=$'%{\e[0;31m%}'        # Red
GREEN=$'%{\e[0;32m%}'      # Green
YELLOW=$'%{\e[0;33m%}'     # Yellow
BLUE=$'%{\e[0;34m%}'       # Blue
PURPLE=$'%{\e[38;5;135m%}' # Purple
MAGENTA=$'%{\e[0;35m%}'    # Magenta
CYAN=$'%{\e[0;36m%}'       # Cyan
WHITE=$'%{\e[0;37m%}'      # White

# Prompt color scheme and customization
setopt PROMPT_SUBST
PROMPT="${YELLOW}[${PURPLE}\$(cmdline_current_git_branch)${CYAN}%~${YELLOW}]${WHITE}\$ "

# ls colors
# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Global aliases
alias ls="ls -a"

# Git Helpers
function pull {
    git pull origin $(current_git_branch)
}
function push {
    git push origin $(current_git_branch)
}
function force-push {
    if [[ $(current_git_branch) == "master" ]]; then
        echo "DON'T FORCE-PUSH TO MASTER WTF"
        return
    fi
    git push origin $(current_git_branch) --force
}
