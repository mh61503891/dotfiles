#!/bin/sh

dotfiles_home=$(cd "$(dirname "$0")" && cd .. && pwd)

brew bundle --verbose --file $dotfiles_home/homebrew/Brewfile
