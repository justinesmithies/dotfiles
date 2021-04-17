" init.vim - Justine Smithies

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Plugins

" startup for vim-plug
call plug#begin("~/.config/nvim/plugged")

" Make sure you use single quotes

" COC Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-polyglot Plugin
Plug 'sheerun/vim-polyglot'

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
set nocompatible                                    " Use Vim defaults (much better!)

" Colours
set termguicolors                                   " Enable 24-bit colors on terminal
syntax enable                                       " Enable syntax highlighting
set background=dark                                 " Use colors that suit a dark background
colorscheme gruvbox                                 " Change colorscheme
hi Normal guibg=NONE ctermbg=NONE                   " Make sure background stays transparent

" Search
set hlsearch                                        " Enables search result highlighting

set wildmode=longest,list,full
set wildmenu

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" COC

" CoC extensions to be auto installed
let g:coc_node_args = ['--max-old-space-size=8192']
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-phpls',
    \ 'coc-sh',
    \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" IndentLines
" Disable IndentLines by default
let g:indentLine_enabled = 0

" Toggle IndentLines
:noremap <F5> :IndentLinesToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Auto commands

" Get both NERDTree and Startify working at startup if no args passed
autocmd StdinReadPre * let g:isReadingFromStdin = 1
autocmd VimEnter * if !argc() && !exists('g:isReadingFromStdin') | Startify | endif

au! BufWritePost ~/.config/nvim/init.vim source %      " auto source when writing to init.vm alternatively you can run :source ~/.config/nvim/init.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Mappings
" Silent version of the super user edit, sudo tee trick.
cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
" Talkative version of the super user edit, sudo tee trick.
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"

