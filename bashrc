# .bashrc

# Debug slow bash prompt:  "bash -lv" https://bbs.archlinux.org/viewtopic.php?id=90529

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

black_="\[\033[0;30m\]"
blue_="\[\033[0;34m\]"
green_="\[\033[0;32m\]"
cyan_="\[\033[0;36m\]"
red_="\[\033[0;31m\]"
purple_="\[\033[0;35m\]"
brown_="\[\033[0;33m\]"
lightgray_="\[\033[0;37m\]"
gray_="\[\033[1;30m\]"
lightblue_="\[\033[1;34m\]"
lightgreen_="\[\033[1;32m\]"
lightcyan_="\[\033[1;36m\]"
lightred_="\[\033[1;31m\]"
lightpurple_="\[\033[1;35m\]"
lightyellow_="\[\033[1;33m\]"
white_="\[\033[1;37m\]"
nocolor_="\[\033[0m\]"

case `hostname -s` in
  rich-*) promptcolor_="$green_" ;;
  build-*|pa-*) promptcolor_="$blue_" ;;
  w2-*|wdc-*) promptcolor_="$purple_" ;;
  *) promptcolor_="$lightgray_" ;;
esac

case `whoami` in
  root) promptchar_="${lightred_}#${nocolor_}" ;;
  *) promptchar_="${lightgray_}\$${nocolor_}" ;;
esac

prompttext_=`/usr/bin/hostname -s | /usr/bin/sed -e 's/^rich\-//' -e 's/^pa-lin-//'`

source ~/.bash/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_STATESEPARATOR=' '

PS1="${brown_}[${promptcolor_}${prompttext_}${white_}:${cyan_}\w${brown_}]${nocolor_}"'$(__git_ps1 " (%s) ")'"$promptchar_ "
PS2='> '
PS4='+ '

# User specific aliases and functions
if [ "$PS1" ]; then
    export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
    case $TERM in
        linux*)
            #export PROMPT_COMMAND='~/bin/crttitle --auto;'"$PROMPT_COMMAND"
            #export PROMPT_COMMAND="~/bin/crttitle `/usr/bin/id -un`@`/usr/bin/hostname -s`"\;"$PROMPT_COMMAND"
            #export PROMPT_COMMAND="echo -n ]\\;`/usr/bin/id -un`@`/usr/bin/hostname -s`"\;"$PROMPT_COMMAND"
            #PS1="];`/usr/bin/id -un`@`/usr/bin/hostname -s`$PS1"
            PS1="\e];`/usr/bin/id -un`@`/usr/bin/hostname -s`\a$PS1"
            ;;
    esac
fi
set -o vi
export PAGER=less
. ~/.aliases

source ~/.bash/git-completion.bash

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
