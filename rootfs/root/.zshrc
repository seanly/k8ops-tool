
export ZSH="/root/.oh-my-zsh"
ZSH_THEME="bira"

plugins=(
  git
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
  kube-aliases
  kube-ps1
)

source $ZSH/oh-my-zsh.sh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias k=kubectl
alias h3=helm3
PROMPT=$PROMPT'$(kube_ps1) '


