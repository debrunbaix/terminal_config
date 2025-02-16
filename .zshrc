# -- OH MY ZSH --
export ZSH="$HOME/.oh-my-zsh"

# -- THEME --
ZSH_THEME="debrunbaix"

# -- PLUGINS --
plugins=(
  git
  urltools
  web-search
)

# -- activate OMZ --
source $ZSH/oh-my-zsh.sh

# -- ALIAS --
alias python="/usr/bin/python3"
alias e="exit"
alias maj="sudo apt update && sudo apt upgrade -y"
alias ipa="ip -br -c a"
alias install="sudo apt install"
alias r2="radare2"
alias bat="batcat"
alias v="nvim"
alias ya="yazi"

# -- EXEGOL --
export PATH="$PATH:/home/debrunbaix/.local/bin"
alias exegol='sudo -E /home/debrunbaix/.local/bin/exegol'

eval "$(zoxide init zsh)"
