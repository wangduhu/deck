# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="kolo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    autojump
    copyfile
    django
    docker
    emacs
    git
    github
    helm
    history
    httpie
    pyenv
    python
    sudo
    systemd
    thefuck
    tmux
    ubuntu
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -a ~/.sh.d/aliases ]] && . ~/.sh.d/aliases
[[ -a ~/.sh.d/utils ]] && . ~/.sh.d/utils
[[ -a ~/.sh.d/envs ]] && . ~/.sh.d/envs

## envs
export GOPATH=${HOME}/.go       # go
export NVM_ROOT=${HOME}/.nvm    # nvm

# java
# export JAVA_HOME=/opt/jdk
# export CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
# export MAVEN_ROOT=/opt/maven

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
# export PS1="\u@ \W $ "
# tab title of Terminator
# PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# different in macos
if [[ $(uname) = "Darwin" ]]; then
    export MAVEN_ROOT=${HOME}/Applications/apache-maven-3.5.0  # maven
fi


[[ -a /usr/share/stardict/ ]] && export STARDICT_DATA_DIR=/usr/share/stardict/
[[ -a /usr/local/share/stardict/ ]] && export STARDICT_DATA_DIR=/usr/local/share/stardict/


## PATH

# declare -A paths
paths=(
    /opt/cling/bin
    /opt/eclipse/.
    /opt/emacs/bin
    #/opt/firefox/bin
    /opt/go/bin
    /opt/gradle/bin
    /opt/matlab/bin
    /opt/mongodb/bin
    /opt/node/bin
    /opt/octave/bin
    /opt/openocd/bin
    /opt/phantomjs/bin
    /opt/qt/gcc_64/bin
    /opt/qtcreator/bin
    /opt/wine-devel/bin
    /opt/x-tools/arm-wally-linux-gnueabi/bin
    ${ANDROID_SDK}/tools
    ${ANDROID_SDK}/platform-tools/.
    ${ANDROID_STUDIO}/bin
    ${GOPATH}/bin
    ${JAVA_HOME}/bin
    ${MAVEN_ROOT}/bin
    ${TEXLIVE_ROOT}/bin/x86_64-linux
)

for p in ${paths[@]}; do
    if [[ -a ${p} ]]; then
        export PATH=${p}:${PATH}
    fi
done

export PATH=${HOME}/.local/bin:${PATH}
export PATH=${HOME}/.go/bin:${PATH}

if [[ $(uname) = "Darwin" ]]; then
    export PATH=${HOME}/Library/Python/3.6/bin:${PATH}
    export PATH="/usr/local/texlive/2019/bin/x86_64-darwin/":${PATH}
fi



# direnv

if ! [[ $(uname) = "Darwin" ]]; then
    eval "$(direnv hook zsh)"
fi

if [[ -a ${HOME}/.instances ]]; then
    h=( $(cat ${HOME}/.instances) )
    if [[ $#h -gt 0 ]]; then
        zstyle ':completion:*:ssh:*' hosts $h
        zstyle ':completion:*:slogin:*' hosts $h
    fi
fi
export GTAGSLIBPATH=$HOME/Project/.gtags/
