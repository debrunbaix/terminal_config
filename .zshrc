# -- OH MY ZSH --
export ZSH="$HOME/.oh-my-zsh"

# -- THEME --
ZSH_THEME="debrunbaix"

# -- PLUGINS --
plugins=(
  git
  urltools
)

# -- activate OMZ --
source $ZSH/oh-my-zsh.sh

# -- ALIAS --
alias python="/usr/bin/python3"
alias python2="/usr/local/bin/python2.7"
alias e="exit"
alias maj="sudo apt update && sudo apt upgrade -y"
alias ipa="ip -br -c a"
alias ghidra="/usr/local/bin/ghidra_10.4_PUBLIC/ghidraRun"
alias install="sudo apt install"
alias r2="radare2"
alias bat="batcat"

# -- EXEGOL --
export PATH="$PATH:/home/debrunbaix/.local/bin"
alias exegol='sudo -E /home/debrunbaix/.local/bin/exegol'
