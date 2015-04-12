#-------------------------------------------------------------------------------
# exports							*exports*

# Ruby env
export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export LANG="en_US.UTF-8"

#-------------------------------------------------------------------------------
# General zsh settings						*general*

HISTFILE=~/.histfile		# File to save history in
HISTSIZE=500			# Remember last 500 lines
SAVEHIST=1000			# Save last 1000 lines to file
setopt autocd extendedglob	# Enable autocd and extended globbing
unsetopt beep			# Disable terminal bell
bindkey -v			# Vim key bindings	

# Lines added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'  

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors	# Colors!

# Prompt
PROMPT="%{$fg[green]%}┌─%{$reset_color%}[%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%M %{$fg[green]%}%B%~%b]
%{$fg[green]%}└─╼ %{$reset_color%}"

setopt no_case_glob             # Case insensitive globbing
setopt interactivecomments      # Ignore lines prefixed with '#'
setopt hist_ignore_dups         # Ignore duplicates in history
setopt noflowcontrol            # Disable flow control
limit coredumpsize 0            # Disable core dumps
setopt RM_STAR_WAIT             # Wait 10s before 'rm *' and 'rm path/*'
setopt correctall               # Auto correct commands

# Command not found hook
source /usr/share/doc/pkgfile/command-not-found.zsh

# Path expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Colorize completion
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

# Do (not) complete current directory
zstyle ':completion:*' ignore-parents parent pwd

# Bind home and end keys
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line

#-------------------------------------------------------------------------------
# Aliases							*aliases*

alias ls='ls -x -L -h --color=auto --group-directories-first --ignore=lost+found'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias rsync='rsync -av --progress'
alias feh='feh -g 2560x1600 -F -Y --auto-zoom'
alias wifi='wicd-curses'

# Pacman aliases
alias pacsyy='sudo pacman -Syy' # Force pacman db update
alias pacsyu='sudo pacman -Syu' # Update pacman db and upgrade all packages
alias pacs='sudo pacman -S'     # Install package from remote repos
alias pacu='sudo pacman -U'     # Install package from local file
alias pacr='sudo pacman -Rns'   # Remove package, config, and unnecessary dependencies

#-------------------------------------------------------------------------------
# Functions							*functions*

# Remove orphaned packages
orphans() {
    if [[ ! -n $(pacman -Qdt) ]]; then
        echo "No orphaned packages!"
    else
        sudo pacman -Rs $(pacman -Qdtq)
    fi
}
