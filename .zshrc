PROMPT='$ '

export LANG=ja_JP.UTF-8
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# path
export PATH="$PATH:$HOME/ghq/gitlab.sis.eecs.tottori-u.ac.jp/higashino/dotfiles/bin"

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# bun
export PATH="$HOME/.bun/bin:$PATH"

# ruby
export BUNDLE_JOBS=4

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# Android Studio
export PATH=$PATH:~/Library/Android/sdk/platform-tools
export PATH=$PATH:~/Library/Android/sdk/tools/bin
export PATH=$PATH:~/Library/Android/sdk/emulator
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

# flutter
export PATH=$PATH:~/.opt/flutter/bin
export PATH=$PATH:~/.pub-cache/bin

# zsh history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
setopt append_history
setopt inc_append_history
setopt extended_history

ZSH_DIR="${HOME}/.zshrc.d"

if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  for file in ${ZSH_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi
