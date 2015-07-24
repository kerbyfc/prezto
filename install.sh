#!/bin/zsh

[[ ! -d "~/.zprezto" ]] && git clone --recursive https://github.com/kerbyfc/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

mkdir -p $HOME/.zsh.before
mkdir -p $HOME/.zsh.after
mkdir -p $HOME/.zsh.prompts

[[ ! -d "~/.zprezto/config" ]] && git clone --recursive https://github.com/kerbyfc/zpreztoc.git "${ZDOTDIR:-$HOME}/.zprezto/config"

ln -nfs "$HOME/.zprezto/config/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc"
