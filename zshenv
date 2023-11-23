eval "$(starship init zsh)"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion::complete:*' gain-privileges 1

setopt print_eight_bit
setopt hist_ignore_all_dups
setopt extended_glob

alias sudo='sudo '
alias vim='nvim'
if [[ $(command -v exa) ]]; then
	alias ls='exa --icons --git'
	alias lsl='ls -la'
fi

bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

export ANKI_WAYLAND=1
source /etc/environment

neofetch
