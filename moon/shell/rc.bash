# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


[[ -a ~/.sh.d/aliases ]] && . ~/.sh.d/aliases
[[ -a ~/.sh.d/utils ]] && . ~/.sh.d/utils
[[ -a ~/.sh.d/envs ]] && . ~/.sh.d/envs


## envs
export AUTOJUMP_ROOT=/usr/share/autojump # autojump
export GOPATH=${HOME}/.go       # go
export NVM_ROOT=${HOME}/.nvm    # nvm
export PYENV_ROOT=/opt/pyenv    # pyenv

# java
export JAVA_HOME=/opt/jdk
export CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
export MAVEN_ROOT=/opt/maven

# ROS
export ROS_DISTRO=kinetic
export ROS_ROOT=/opt/ros/${ROS_DISTRO}
export ROS_HOSTNAME=wally.local
export ROS_MASTER_URI=http://wally.local:11311

# Andoid
export ANDROID_SDK=/opt/android-sdk
export ANDROID_STUDIO=/opt/android-studio

# texlive
export TEXLIVE_ROOT=/opt/texlive
export MANPATH=${MANPATH}:${TEXLIVE_ROOT}/texmf-dist/doc/man
export INFOPATH=${INFOPATH}:${TEXLIVE_ROOT}/texmf-dist/doc/info

# misc
export EDITOR="emacsclient"
export GTAGSLIBPATH=$HOME/.gtags # gtags
export GTAGSLABEL=pygments

## shell
export PS1="\u@ \W $ "
# tab title of Terminator
PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# different in macos
if [[ uname = "Darwin" ]]; then
    export AUTOJUMP_ROOT=/usr/local/Cellar/autojump/22.5.1/share/autojump
    export MAVEN_ROOT=${HOME}/Applications/apache-maven-3.5.0  # maven
    export PYENV_ROOT="$HOME/.pyenv"
fi


[[ -a /usr/share/stardict/ ]] && export STARDICT_DATA_DIR=/usr/share/stardict/
[[ -a /usr/local/share/stardict/ ]] && export STARDICT_DATA_DIR=/usr/local/share/stardict/


## PATH

declare -A paths
paths=([/opt/cling]=bin
       [/opt/eclipse]=.
       [/opt/emacs]=bin
       # [/opt/firefox]=bin
       [/opt/go]=bin
       [/opt/gradle]=bin
       [/opt/matlab]=bin
       [/opt/mongodb]=bin
       [/opt/node]=bin
       [/opt/octave]=bin
       [/opt/openocd]=bin
       [/opt/phantomjs]=bin
       [/opt/qt]=gcc_64/bin
       [/opt/qtcreator]=bin
       [/opt/wine-devel]=bin
       [/opt/x-tools/arm-wally-linux-gnueabi]=bin
       [${ANDROID_SDK}]=tools
       [${ANDROID_SDK}/platform-tools]=.
       [${ANDROID_STUDIO}]=bin
       [${GOPATH}]=bin
       [${JAVA_HOME}]=bin
       [${MAVEN_ROOT}]=bin
       [${PYENV_ROOT}]=bin
       [${TEXLIVE_ROOT}]=bin/x86_64-linux
      )

for key in ${!paths[*]}
do
    if [[ -a ${key} ]]; then
        export PATH=${key}/${paths[$key]}:${PATH}
    fi
done


## extra work to do after setting envs, mainly source file
# nvm
[[ -s "${NVM_ROOT}/nvm.sh" ]] && . "$NVM_ROOT/nvm.sh"
[[ -s "${NVM_ROOT}/bash_completion" ]] && source "${NVM_ROOT}/bash_completion"

## autojump
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
[[ "${AUTOJUMP_ROOT}x" == "x" ]] || source ${AUTOJUMP_ROOT}/autojump.bash

# ROS
# source ${ROS_ROOT}/setup.bash
# source ${HOME}/.rosrc

# direnv
eval "$(direnv hook bash)"


## only on macos
if [[ uname = "Darwin" ]]; then
    export STARDICT_DATA_DIR=/opt/gtk/share/stardict/dic/
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

# thefuck
# eval $(thefuck --alias)

# pyenv
if [[ $(uname) = "Linux" ]]; then
    [[ "${PYENV_ROOT}x" != "x" ]] && eval "$(pyenv init -)"
fi

# bash-insulter
if [[ -f ~/.bash.d/bash.command-not-found-msgs ]]; then
    . ~/.bash.d/bash.command-not-found-msgs
fi

if [[ -f ~/.bash.d/bash.command-not-found ]]; then
    . ~/.bash.d/bash.command-not-found
fi
