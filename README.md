# MilesManners/dotfiles

These are my dotfiles for my workstation.

[neovim](https://neovim.io/) - [.config/nvim](.config/nvim)
- [Dein](https://github.com/Shougo/dein.vim) plugin manager - [den.vim](.config/nvim/dein.vim)
- [CoC](https://github.com/neoclide/coc.nvim) - [coc-settings.json](.config/nvim/coc-settings.json)
- [Moonlight](http://vimcolors.com/1189/moonlight/dark) theme
- See [.config/nvim/plugins.vim](.config/nvim/plugins.vim) for a full list of plugins

[zsh](https://www.zsh.org/) - [.zshrc](.zshrc)
- [Oh My Zsh](https://ohmyz.sh/) configuration framework
- [Spaceship](https://denysdovhan.com/spaceship-prompt/) theme

### Installation
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/MilesManners/dotfiles.git $HOME/dotfiles
dotfiles checkout
```

### Optionally add the `dotfiles` alias to your `.bashrc`, `.zshrc`, etc.
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```
