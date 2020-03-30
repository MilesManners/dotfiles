#!/bin/bash

echo -e "Checking for Git and Zsh\n"
[ -x "$(command -v git)" ] && has_git=1
[ -x "$(command -v zsh)" ] && has_zsh=1

if [ "$has_git" ] && [ "$has_zsh" ]; then
  echo -e "Found Git and Zsh\n"
else
  [ -x "$(command -v nix-env)" ] && manager="nix-env -i"
  [ -x "$(command -v pacman)" ]  && manager="pacman -S --noconfirm"
  [ -x "$(command -v apt-get)" ] && manager="apt-get install -y"
  [ -x "$(command -v dnf)" ]     && manager="dnf install -y"
  [ -x "$(command -v yum)" ]     && manager="yum install -y"
  [ -x "$(command -v zypper)" ]  && manager="zypper install"
  [ -x "$(command -v urpmi)" ]   && manager="urpmi"
  [ -x "$(command -v apk)" ]     && manager="apk add"

  [ ! -z ${var+manager} ] && echo "Package manager not found/supported" && exit 1

  [ ! $has_git ] && (echo "Installing Git" && sudo ${manager} git || echo "Failed to install Git" && exit 1)
  [ ! $has_zsh ] && (echo "Installing Zsh" && sudo ${manager} zsh || echo "Failed to install Zsh" && exit 1)
fi

[ -d "$HOME/dotfiles" ] && echo -e "Dotfiles already cloned" && exit

echo -e "Cloning dotfiles\n"
# Clone dotfiles repo
git clone --bare https://github.com/MilesManners/dotfiles $HOME/dotfiles

# Helper function for mapping dotfiles
function dotfiles {
  /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}

# Hide untracked files
dotfiles config status.showUntrackedFiles no

echo -e "\nBacking up conflicting dotfiles to $HOME/dotfiles-backup\n";
dotfiles ls-tree --full-tree -r --name-only HEAD | xargs -I% sh -c '[ -f % ] && mkdir -p $HOME/dotfiles-backup/% && mv % $HOME/dotfiles-backup/% && rm -f %'

# Try to pull dotfiles
if dotfiles checkout; then
  echo -e "Checked out dotfiles\n";
else
  echo -e "Failed to checkout dotfiles" && exit 1
fi
