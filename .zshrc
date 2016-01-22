# The following lines were added by compinstall
zstyle :compinstall filename '/home/nsampath/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# To stop echo the cmd actually run
set +x

# Need to unset to make tmux work correct
#LANG=utf-8
unset LANG
unset TMUX

# See http://linux.die.net/man/1/zshoptions
setopt NO_BEEP
setopt C_BASES
#setopt PRINT_EIGHT_BIT
#setopt SH_NULLCMD
#setopt AUTO_CONTINUE
#setopt PATH_DIRS
#setopt NO_NOMATCH
setopt EXTENDED_GLOB
#disable -p '^'
#setopt NOMATCH
#setopt NOTIFY

#setopt NO_CORRECT

# typing name of directory will cd to it
setopt AUTOCD

setopt ALWAYS_LAST_PROMPT
setopt AUTO_LIST
setopt AUTO_MENU

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

SAVEHIST=9000
HISTSIZE=9000
HISTFILE=~/.zsh_history

# Directory Stack
DIRSTACKSIZE=20
# Make cd push the old directory onto the stack
setopt AUTOPUSHD
setopt PUSHDSILENT
setopt PUSHDTOHOME

# Remove duplicate entries
setopt pushdignoredups

# This reverts the +/- operators.
setopt pushdminus

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

autoload -Uz compinit
compinit
#zstyle :compinstall filename '/home/nsampath/.zshrc'
zmodload -i zsh/complist
zstyle ':completion:*' menu select=2

# Needed for tmux?
export TERM=xterm-256color

# Vi bindings
bindkey -v

# Alt-Enter to enter a newline in a multiline cmd
bindkey '^[^M' self-insert-unmeta

# To open the cmd in an editor
# The first line loads the function. The second line creates a new widget for the Z shell line editor (zle) from the function of the same name.
# Doesn't work
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# TOO SLOW!
#autoload -Uz vcs_info
##zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:(p4):*' branchformat '%b%F{1}'
#zstyle ':vcs_info:*' disable-patterns "$HOME(|/*)"
#precmd () { vcs_info }
#
#function precmd() {
#    #this will update directory in terminal window
#    #print -Pn "\e]2;%~\a"
#    #if [[ $PWD =~ '\/home\/scratch.nsampath\/(\w*)/' ]]; then
#    #    PROMPT_PREFIX="<$match[1]>:"
#    #else
#    #    PROMPT_PREFIX=""
#    #fi
#    #local p4client=`p4 info | grep 'Client name' | sed 's/.*name: //'`
#    #PROMPT_PREFIX=$p4client
#}

setopt PROMPT_SUBST
#PS1=' %F{yellow}${vcs_info_msg_0_}> %F{green}%~ %f%#'$'\n''> '
PS1=$'\n''%F{red}<%F{green}%~%F{red}> %f'$'\n''%F{red}# %f '
RPROMPT='%F{red}[%h]%f'

# load Nvidia modules
#source /home/utils/modules-tcl/init/`basename $SHELL`
#module load vim
#module load tmux
#module load git

if [ -e ~/.aliases ]; then
    source ~/.aliases
fi


