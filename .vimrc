

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Tagbar Plugin
Plug 'preservim/tagbar'

" NERDTree Plugin
Plug 'preservim/nerdtree'

" vim-devicons Plugin
Plug 'ryanoasis/vim-devicons'

" vim-airline Plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Settings
" Basic
set encoding=utf-8                                  " Set encoding to utf-8
set number                                          " Show line numbers on the sidebar

" Colours
set termguicolors                                   " Enable 24-bit colors on terminal
syntax enable                                       " Enable syntax highlighting
set background=dark                                 " Use colors that suit a dark background
colorscheme gruvbox                                 " Change colorscheme

" Search
set hlsearch                                        " Enables search result highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Airline
let g:airline#extensions#tabline#enabled = 1        " Enable the list of buffers
let g:airline_theme='powerlineish'                  " Match airline theme with vim colorscheme
let g:airline_powerline_fonts = 1                   " Use powerline fonts for airline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NERDTree
let NERDTreeShowHidden=1                            " Show hidden files on NERDTree

" Toggle NerdTree
:nnoremap <F7> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" TagBar
" Toggle TagBar
:nnoremap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Auto commands
" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Open nerdtree when no file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Exit Vim if NERDTree is the only split
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Mappings
" Silent version of the super user edit, sudo tee trick.
cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
" Talkative version of the super user edit, sudo tee trick.
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"


