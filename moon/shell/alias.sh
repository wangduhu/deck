## customed alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias em='/opt/emacs/bin/emacs --debug-init&'
alias jd="cd ~/Desktop"
alias jj='cd ~/Wally/Journal'
alias vi='vim'
alias tp='trash-put'
alias svd='supervisord -c ${HOME}/.local/share/supervisor/supervisord.conf'
alias svc='supervisorctl -c ${HOME}/.local/share/supervisor/supervisord.conf'
alias ff='firefox &>/dev/null &'

alias manl='man -M $HOME/Documents/LinuxMan'
alias manc='man -M $HOME/Documents/man-zh'

# macos
if [[ $(uname) == "Darwin" ]]; then
    alias rm=trash
    alias RM=rm
fi

# DEPRECATED, but keeped as refrence
# alias ssocket='nohup sslocal -c /etc/shadowsocks.json /dev/null 2>&1&'
# alias xc='xclip -selection c'
# alias cb='nohup chromium-browser &2>/dev/null &'
# alias ff='nohup firefox &>/dev/null &'
# alias ak='anki &>/dev/null &'
# alias mibbrowser='nohup /opt/ireasoning/mibbrowser/browser.sh &>/dev/null &'
# alias g='gnome-open'
# alias briss='java -jar /opt/briss/briss-0.9.jar'
# alias ec='emacsclient'      # ec used for script
# alias fr='wine ${HOME}/.wine/drive_c/Program\ Files/Foxit\ Software/Foxit\ Reader/FoxitReader.exe '
# alias rt='cd $(wt git --root)'
# alias tf2='cd /var/tmp && rosrun tf2_tools view_frames.py && evince frames.pdf &'
# alias map='cd /tmp && rosrun map_server map_saver && eog map.pgm &'
# alias sc='sdcv'
# alias jb='cd ${HOME}/Project/wander/wally/source/_posts'
# alias jw='cd ${HOME}/Project/wander'
