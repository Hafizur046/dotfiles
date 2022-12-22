# Variables
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
PS1="${GREEN}\u@\h \w $ ${RESET} "

# Aliases
alias xampp='sudo /opt/lampp/xampp'
alias cls='clear'
alias ls='ls --color='auto''
alias la='ls -a --color='auto''
alias sd='sudo shutdown now'
alias ni='sudo npm install'
alias ns='nodemon --inspect'
alias gitpush='git push -u origin master'
alias ibus-start='ibus-daemon --xim -drx --desktop=kd'
alias fuckgoogle='ping google.com'
alias ..='cd ..'
alias c='clear'
alias l='ls'
alias vim='nvim'
alias nano='nvim'
alias mongo='docker exec -it mongo mongosh'

# Export
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export NODE_SKIP_PLATFORM_CHECK=1
export REACT_EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
