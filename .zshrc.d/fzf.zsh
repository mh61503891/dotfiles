# Requirements:
# brew install fzf z ghq

# fzf
export FZF_DEFAULT_OPTS='--reverse --no-separator --info=inline-right:" "'
source <(fzf --zsh)

# z
source `brew --prefix`/etc/profile.d/z.sh

# fzf-z - jump around with fzf
fzf-z() {
  local info="fzf-z"
  local res=$(z | sort -rn | cut -c 12- | fzf --info=inline-right:" ${info} ")
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
    zle reset-prompt
  else
    zle reset-prompt
    return 1
  fi
}
zle -N fzf-z
bindkey '^Z' fzf-z

# fzf-history - history with fzf
fzf-history() {
  local info="fzf-history"
  local res=$(history -n 1 | tail -r  | awk '!a[$0]++' | fzf --info=inline-right:" ${info} ")
  BUFFER="$res"
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history
bindkey '^R' fzf-history

# fzf-ghq-list - ghq list with fzf
fzf-ghq-list() {
  local info="fzf-ghq-list"
  local res=$(ghq list --full-path | fzf --info=inline-right:" ${info} ")
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
    zle reset-prompt
  else
    zle reset-prompt
    return 1
  fi
}
zle -N fzf-ghq-list
bindkey '^X^G^L' fzf-ghq-list

fzf-cd() {
  local res=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
