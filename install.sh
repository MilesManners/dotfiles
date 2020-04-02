#!/bin/bash

[ -d "$HOME/dotfiles" ] && echo -e "Dotfiles already cloned" && exit

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

# Clone dotfiles repo
echo -e "Cloning dotfiles\n"
git clone --bare https://github.com/MilesManners/dotfiles $HOME/dotfiles

# Helper function for mapping dotfiles
dotfiles () {
  /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}

# Get list of branches
readarray -t branches <<< $(dotfiles ls-remote --heads origin | sed 's?.*refs/heads/??')

branch_menu () {
  select branch; do
    if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ]; then
      echo "Selected $branch branch"
      break;
    else
      echo "Wrong selection: Select any number from 1-$#"
    fi
  done
}

PS3="Select branch: "
branch_menu "${branches[@]}"

# Hide untracked files
dotfiles config status.showUntrackedFiles no

echo -e "\nBacking up conflicting dotfiles to $HOME/dotfiles-backup\n";
dotfiles ls-tree --full-tree -r --name-only HEAD | xargs -I% sh -c '[ -f % ] && mkdir -p $HOME/dotfiles-backup/% && cp % $HOME/dotfiles-backup/%'

# Try to pull dotfiles
if dotfiles checkout -f; then
  echo -e "Checked out dotfiles\n";
else
  echo -e "Failed to checkout dotfiles" && exit 1
fi
