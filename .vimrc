" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Tagbar Plugin
Plug 'preservim/tagbar'

" NERDTree Plugin
Plug 'preservim/nerdtree'

" Initialize plugin system
call plug#end()

" General settings

set encoding=utf-8

" Enables absolute line numbers
set number

" Enables search result highlighting
set hlsearch

" Disables automatic comment insertion (i.e. automatically appending something like '#' to the beginning of a new line when the current line is a comment)
"set formatoptions-=cro

" Sets searches to be case-insensitive if a search is all lowercase and case-sensitive if a search has any capital letters
"set ignorecase smartcase

" Set color scheme
set t_Co=256
syntax on
set background=dark
colorscheme gruvbox

" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.
set termguicolors

" Open nerdtree when no file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only split
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Silent version of the super user edit, sudo tee trick.
cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
" Talkative version of the super user edit, sudo tee trick.
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"

" Map various key bindings
:nnoremap <F7> :NERDTreeToggle<CR>
:nnoremap <F8> :TagbarToggle<CR>

