if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh not installed"
  echo "----- Downloading Oh My Zsh -----"

  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

  echo "*=====* Completed *=====*"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Theme
if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
  echo "Spaceship Prompt not installed"
  echo "----- Downloading Spaceship Prompt -----"

  git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
  ln -s $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme

  echo "*=====* Completed *=====*"
fi

ZSH_THEME="spaceship"

# Plugins
if [ ! -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]; then
  echo "Fast Syntax Highlighting not installed"
  echo "----- Downloading Fast Syntax Highlighting -----"

  git clone https://github.com/zdharma/fast-syntax-highlighting $ZSH_CUSTOM/plugins/fast-syntax-highlighting

  echo "*=====* Completed *=====*"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Zsh Autosuggestions not installed"
  echo "----- Downloading Autosuggestions -----"

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

  echo "*=====* Completed *=====*"
fi

plugins=(
  git
  fast-syntax-highlighting
  zsh-autosuggestions
  rust
  rustup
  pip
  yarn
)

source $ZSH/oh-my-zsh.sh

# Add user bin to path
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Add Yarn to path
if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

# Add perl to path
if [ -d "$HOME/perl5" ]; then
  PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi

if [ -x "$(command -v ruby)" ]; then
  PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi

# dotfiles 
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
compdef dotfiles='git'

setopt complete_aliases

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export NO_PROXY=$no_proxy
    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\?\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi
        local proxy=$1
        export http_proxy=$proxy \
               HTTP_PROXY=$proxy \
               https_proxy=$proxy \
               HTTPS_PROXY=$proxy \
               ftp_proxy=$proxy \
               FTP_PROXY=$proxy \
               rsync_proxy=$proxy \
               RSYNC_PROXY=$proxy
        echo "Proxy environment variable set."
        return 0
    fi
}

function proxy_off() {
    unset no_proxy http_proxy https_proxy ftp_proxy rsync_proxy \
          NO_PROXY HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo -e "Proxy environment variable removed."
}

# fnm
eval "$(fnm env)"

# Show system info with Neofetch
if [ -x "$(command -v neofetch)" ]; then
  neofetch
elif [ -x "$(command -v screenfetch)" ]; then
  screenfetch
fi
