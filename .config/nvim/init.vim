
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Plugins
call plug#begin("~/.config/nvim/plugged")

" Make sure you use single quotes

" vim-startify Plugin
Plug 'mhinz/vim-startify'

" Tagbar Plugin
Plug 'preservim/tagbar'

" NERDTree Plugin
Plug 'preservim/nerdtree'

" vim-devicons Plugin
Plug 'ryanoasis/vim-devicons'

" vim-airline Plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" IndentLine Plugin
Plug 'Yggdroot/indentLine'

" vim-css-color
Plug 'ap/vim-css-color'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Settings
" Basic
set encoding=utf-8                                  " Set encoding to utf-8
set number                                          " Show line numbers on the sidebar
set clipboard=unnamedplus                           " Copy paste between vim and everything else
" Colours
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors                                   " Enable 24-bit colors on terminal
syntax enable                                       " Enable syntax highlighting
set background=dark                                 " Use colors that suit a dark background
colorscheme gruvbox                                 " Change colorscheme

" Search
set hlsearch                                        " Enables search result highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Startify

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ] " Close NERDTRee before saving session
let g:startify_session_persistence = 1                                 " Save session on exit to session.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Airline
let g:airline#extensions#tabline#enabled = 1        " Enable the list of buffers
let g:airline_theme='powerlineish'                  " Match airline theme with vim colorscheme 
let g:airline_powerline_fonts = 1                   " Use powerline fonts for airline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NERDTree
let NERDTreeShowHidden=1                            " Show hidden files on NERDTree

" Toggle NerdTree
:nnoremap <F7> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only split
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" TagBar
" Toggle TagBar
:nnoremap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Startify

" autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 2 | Startify | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" IndentLines
" Disable IndentLines by default
let g:indentLine_enabled = 0

" Toggle IndentLines
:noremap <F5> :IndentLinesToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Auto commands
" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Get both NERDTree and Startify working at startup if no args passed
autocmd StdinReadPre * let g:isReadingFromStdin = 1
autocmd VimEnter * if !argc() && !exists('g:isReadingFromStdin') | Startify | endif

au! BufWritePost ~/.config/nvim/init.vim source %      " auto source when writing to init.vm alternatively you can run :source ~/.config/nvim/init.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Mappings
" Silent version of the super user edit, sudo tee trick.
cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
" Talkative version of the super user edit, sudo tee trick.
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"

