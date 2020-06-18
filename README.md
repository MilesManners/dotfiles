![screenshot](screenshot.png)

These are my dotfiles for my workstation. They are setup as a bare repository.

For more information on a setup like this, check [the atlassian tutorial](https://www.atlassian.com/git/tutorials/dotfiles) or one of the many similar articles.

### [neovim](https://neovim.io/) editor - [.config/nvim](.config/nvim)
- [Dein](https://github.com/Shougo/dein.vim) plugin manager - [den.vim](.config/nvim/dein.vim)
- [CoC](https://github.com/neoclide/coc.nvim) - [coc-settings.json](.config/nvim/coc-settings.json)
  - CoC extensions are preferred to Vim extensions when reasonable for performance
  - Such as `coc-yank` for yank highlighting and `coc-eslint` for JS linting
- [Moonlight](http://vimcolors.com/1189/moonlight/dark) theme
- See [.config/nvim/plugins.vim](.config/nvim/plugins.vim) for a full list of plugins

### [zsh](https://www.zsh.org/) shell - [.zshrc](.zshrc)
- [Oh My Zsh](https://ohmyz.sh/) configuration framework
- [Spaceship](https://denysdovhan.com/spaceship-prompt/) theme

---

## [arch-desktop branch](https://github.com/MilesManners/dotfiles/tree/arch-desktop)

### [i3](https://i3wm.org/) window manager - [.config/i3](.config/i3)
- More specifically, the [i3-gaps-rounded](https://github.com/resloved/i3) fork
- This config is highly specific to my setup at this point

### [Polybar](https://github.com/polybar/polybar) status bar - [.config/polybar](.config/polybar)
- I use [Font Awesome](https://fontawesome.com/) for icons
  - Requires access to pro icons to use all the icons I use, but can easily be changed

### [Termite](https://github.com/thestinger/termite) terminal - [.config/termite](.config/termite)

### Personal Theme - [.themes/oomox-arc-red](.themes/oomox-arc-red) [.icons/oomox-arc-red](.icons/oomox-arc-red)
- [Wallpaper](https://i.imgur.com/19oujdw.png) is the Risk of Rain end cutscene
- Made with [Oomox](https://github.com/themix-project/oomox)
- Some theming is embeded in other files

---

# Installation
### Automatically
A distro-agnostic installation script is available for easy installation of Git, Zsh, and this repo.
You will be prompted to choose a branch from this repository.

Please download the script locally and inspect it if you are concerned about safety.
```bash
/bin/sh -c "$(curl -L https://raw.githack.com/MilesManners/dotfiles/master/install.sh)"
```

### Manually
The directory `$HOME/dotfiles` is used in this example, but any directory can be used.
As is the same for the `dotfiles` command.
```bash
git clone --bare https://github.com/MilesManners/dotfiles.git $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

Optionally add the `dotfiles` alias to your `.bashrc`, `.zshrc`, etc.
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

# Development
**ALWAYS** rebase instead of merging.

### Upstream
Identify the commits you want to pull upstream. One easy way to do this is with `git log`.
```bash
dotfiles log --oneline
```
Create a new branch of the target upstream branch.
Here, the naming convention for staging branches is `<downstream-branch>-upstream-<upstream-branch>`.
The name is arbitrary, but it prevents conflicts and creates consitency in the repo.
```bash
dotfiles checkout -b <downstream-branch>-upstream-<upstream-branch> <upstream-branch>
```
Use `cherry-pick` to add the commits you identified in step one.
```bash
dotfiles cherry-pick <commits>
```
Push your holding branch upstream.
```bash
dotfiles push origin <downstream-branch>-upstream-<upstream-branch>
```
Now, create a pull request to the upstream branch

Once the pull request is merged, the holding branch can be deleted.
```bash
dotfiles push origin :<downstream-branch>-upstream<upstream-branch>
```
