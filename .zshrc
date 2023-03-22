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

SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PROMPT_ASYNC=false

# Plugins
if [ ! -d "$ZSH_CUSTOM/plugins/F-Sy-H" ]; then
  echo "F-Sy-H not installed"
  echo "----- Downloading F-Sy-H -----"

  git clone https://github.com/z-shell/F-Sy-H $ZSH_CUSTOM/plugins/F-Sy-H

  echo "*=====* Completed *=====*"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Zsh Autosuggestions not installed"
  echo "----- Downloading Autosuggestions -----"

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

  echo "*=====* Completed *=====*"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
  echo "Zsh Completions not installed"
  echo "----- Downloading Completions -----"

  git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

  echo "*=====* Completed *=====*"
fi

plugins=(
  git
  F-Sy-H
  zsh-autosuggestions
  zsh-completions
  rust
  pip
  yarn
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# Path building
if [ -d "/mnt/c/" ]; then
  export PATH="$HOME/mnt/c/Users/miles/AppData/Local/Microsoft/WindowsApps:$PATH"
  export PATH="$HOME/mnt/c/Program Files/Docker/Docker/resources/bin:$PATH"
  export PATH="$HOME/mnt/c/Program Files/ProgramData/DockerDesktop/version-bin:$PATH"
  export PATH="$HOME/mnt/c/WINDOWS:$PATH"
fi

# Add user bin
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Add Yarn
if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

# Add perl
if [ -d "$HOME/perl5" ]; then
  PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi

# Add ruby gems
# if [ -x "$(command -v ruby)" ]; then
#   PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
# fi

# Add ruby gems
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init - zsh)"
fi

# Add Poetry
# if [ -d "$HOME/.poetry/bin" ]; then
#   export PATH="$HOME/.poetry/bin:$PATH"
# fi

# Add arkade
if [ -d "$HOME/.arkade/bin" ]; then
  export PATH=$PATH:$HOME/.arkade/bin/
fi

# Add pyenv
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ -x "$(command -v lsd)" ]; then
  alias l='lsd -A'
  alias la='lsd -lh'
  alias ll='lsd -lAh'
  alias ls='lsd'
  alias lsa='lsd -lah'
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

view_pr() {
  pr=$(gh pr list | fzf --preview 'gh pr view {1}' | awk '{print $1}')
  branches=$(gh pr view $pr --json baseRefName,headRefName --jq '"\(.headRefName)..\(.baseRefName)"')

  preview="git diff $branches --color=always -w -- {-1}"
  gh pr view $pr --json files --jq '.files[].path' | fzf -m --ansi --preview $preview
  echo $pr
}

review_prs() {
  login=$(gh api graphql -f query='query { viewer { login } }' --jq '.data.viewer.login')

  if [ -z "$login" ]; then
    echo 'Could not get GitHub username'
    return 1
  fi

  requests=$(gh api graphql -F owner='{owner}' -F name='{repo}' -f query='query($owner: String!, $name: String!) {
    repository(owner: $owner, name: $name) {
      pullRequests(first: 100, states: OPEN) {
        edges {
          node {
            ... on PullRequest {
              number
              title
              headRefName
              reviewRequests(first: 100) {
                nodes {
                  requestedReviewer {
                    ... on User {
                      login
                    }
                  }
                }
              }
            }
          }
        }
        pageInfo {
          endCursor
          hasNextPage
        }
      }
    }
  }' --jq ".data.repository.pullRequests.edges[] | select(.node.reviewRequests.nodes[].requestedReviewer.login | contains(\"$login\")) | \"#\(.node.number)|\(.node.title)|\(.node.headRefName)\"" | awk -F'|' '{printf "\033[32m%s\033[0m|\033[97;1m%s\033[0m|\033[36m%s\033[0m\n", $1, $2, $3}' | column -t -s '|')

  if [ -z "$requests" ] ; then
    echo 'No PRs available to review'
    return 0
  fi

  pr=$(echo $requests | fzf --ansi --preview 'GH_FORCE_TTY=$FZF_PREVIEW_COLUMNS gh pr view {1}' | awk '{print $1}')

  if [ -z "$pr" ]; then
    echo 'No PR selected'
    return 0
  fi

  branches=$(gh pr view $pr --json baseRefName,headRefName --jq '"origin/\(.baseRefName)..origin/\(.headRefName)"')

  if [ -z "$branches" ] ; then
    echo "Failed to pull branches for PR $pr"
    return 0
  fi

  preview="git diff $branches --color=always -w -- {-1}"
  gh pr view $pr --json files --jq '.files[].path' | fzf --ansi --preview $preview

  echo $pr
}

# Initialize completion
autoload -U compinit && compinit

# Show system info with fastfetch or alternatives
if [ -x "$(command -v fastfetch)" ]; then
  fastfetch
elif [ -x "$(command -v neofetch)" ]; then
  neofetch
elif [ -x "$(command -v screenfetch)" ]; then
  screenfetch
fi
