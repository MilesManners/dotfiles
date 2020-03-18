# MilesManners/dotfiles

These are my dotfiles for my workstation. They are setup as a bare repository.

For more information on a setup like this, check https://www.atlassian.com/git/tutorials/dotfiles or one of the many similar articles.

[neovim](https://neovim.io/) - [.config/nvim](.config/nvim)
- [Dein](https://github.com/Shougo/dein.vim) plugin manager - [den.vim](.config/nvim/dein.vim)
- [CoC](https://github.com/neoclide/coc.nvim) - [coc-settings.json](.config/nvim/coc-settings.json)
  - CoC extensions are preferred to Vim extensions when reasonable for performance
  - Such as `coc-yank` for yank highlighting and `coc-eslint` for JS linting
- [Moonlight](http://vimcolors.com/1189/moonlight/dark) theme
- See [.config/nvim/plugins.vim](.config/nvim/plugins.vim) for a full list of plugins

[zsh](https://www.zsh.org/) - [.zshrc](.zshrc)
- [Oh My Zsh](https://ohmyz.sh/) configuration framework
- [Spaceship](https://denysdovhan.com/spaceship-prompt/) theme

### Installation
The directory `$HOME/dotfiles` is used in this example, but any directory can be used.
As is the same for the `dotfiles` command.
```bash
git clone --bare https://github.com/MilesManners/dotfiles.git $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### Optionally add the `dotfiles` alias to your `.bashrc`, `.zshrc`, etc.
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```
