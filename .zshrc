# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/artur.gomes/.oh-my-zsh"
export VISUAL="/Applications/Emacs/Contents/MacOS/Emacs -nw"
export EDITOR="/Applications/Emacs/Contents/MacOS/Emacs -nw"

ZSH_THEME="robbyrussell"
export TERM=xterm-256color
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export VAULT_ADDR=https://civ1.dv.adskengineer.net:8200
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/Users/artur.gomes/Library/Python/3.8/bin:/Users/artur.gomes/.emacs.d/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autodesk
export ADSK_USER=t_gomear
export VAULT_ADDR=https://civ1.dv.adskengineer.net:8200

. ~/projects/operations-center/bin/shell_tools.sh


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.nimble/bin:$HOME/.rvm/bin:$HOME/.rvm/scripts/rvm:$HOME/.local/bin/lvim"
alias lvim=/Users/artur.gomes/.local/bin/lvim
#alias emacs=emacsclient -c -a 'emacs' &
alias ec=~/.config/dotflow/ec
alias poetry_enable=source $(poetry env info --path)/bin/activate
export PATH="$HOME/.poetry/bin:$PATH"
