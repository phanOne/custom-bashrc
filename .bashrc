# if bashrc has content, source it
[[ -s ~/.bashrc ]] && . ~/.bashrc

# PS1='\h:\W \u\$ '
# export HISTTIMEFORMAT="%d/%m/%y %T "
PS1='${debian_chroot:+($debian_chroot)}`if [ $? = 0 ]; then echo "\[\e[32m\]✓ "; else echo "\[\e[31m\]✘ "; fi`\[\e[0;37m\]\A \[\033[0;37m\]\u@\[\033[0;34m\]\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[01;37m\]\$\[\e[0m\] '

# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
