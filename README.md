# Various dotfiles for my [Qtile](http://www.qtile.org/) setup.
Qtile is a very nice, hackable tiling window manager written and configured in Python.

![ScreenShot](screenshot.jpg)

## Details

Below is a list of some of the packages that I use for my current setup.

- **Operating System** --- [Archlinux](https://www.archlinux.org/)
- **AUR Helper** --- [Paru](https://aur.archlinux.org/packages/paru-git/)
- **Boot Loader** --- [Grub](https://wiki.archlinux.org/index.php/GRUB)
- **Window Manager** --- [Qtile](https://aur.archlinux.org/packages/qtile-git)
- **Screen Locker** --- [Betterlockscreen](https://aur.archlinux.org/packages/betterlockscreen)
- **Shell** --- [Bash](https://wiki.archlinux.org/index.php/Bash) using [Starship](https://aur.archlinux.org/packages/starship-git/) 
- **Terminal** --- [Kitty](https://wiki.archlinux.org/index.php/Kitty)
- **Compositor** --- [Picom](https://wiki.archlinux.org/index.php/Picom)
- **Notification Daemon** --- [Dunst](https://wiki.archlinux.org/index.php/Dunst)
- **Application Launcher** --- [Rofi](https://wiki.archlinux.org/index.php/Rofi)
- **File Manager** --- [Ranger](https://aur.archlinux.org/packages/ranger-git)
- **Editor** --- [Neovim](https://aur.archlinux.org/packages/neovim-git)
  - **Plugins**
	- [gruvbox](https://github.com/morhetz/gruvbox)
	- [coc.nvim](https://github.com/neoclide/coc.nvim)
	- [vim-polyglot](https://github.com/sheerun/vim-polyglot)
	- [vim-startify](https://github.com/mhinz/vim-startify)
	- [tagbar](https://github.com/preservim/tagbar)
	- [nerdtree](https://github.com/preservim/nerdtree)
	- [vim-devicons](https://github.com/ryanoasis/vim-devicons)
	- [vim-airline](https://github.com/vim-airline/vim-airline)
	- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
	- [indentLine](https://github.com/Yggdroot/indentLine)
	- [vim-hexokinase](https://github.com/rrethy/vim-hexokinase)
- **Web Browser** --- [Firefox](https://wiki.archlinux.org/index.php/Firefox)
- **PDF Viewer** --- [Zathura](https://wiki.archlinux.org/index.php/Zathura)
- **IRC** --- [Weechat](https://weechat.org/)
- **RSS Feed Reader** --- [Newsboat](https://aur.archlinux.org/packages/newsboat-git)
-
## Keybindings
### Window manager controls
| Keys                      | Action                    |
| ------------------------- | ------------------------- |
| <kbd>CTRL + MOD + r</kbd>            | restart Qtile             |
| <kbd>CTRL + MOD + q</kbd>            | shutdown Qtile            |
| <kbd>MOD + w</kbd>                   | kill window               |
| <kbd>MOD + r</kbd>                   | spawn program             |
| <kbd>MOD + RETURN</kbd>              | spawn terminal            |
| <kbd>CTRL + SPACE</kbd>              | Rofi menu                  |
| <kbd>CTRL + MOD + p</kbd>            | Rofi power menu            |
