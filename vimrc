set nocompatible           " Vim defaults rather than vi ones. Keep at top.
filetype plugin indent on  " Enable filetype-specific settings.
syntax on                  " Enable syntax highlighting.
set backspace=2            " Make the backspace behave as most applications.
set noerrorbells vb t_vb=  " Disable error sounds
set autoindent             " Use current indent for new lines.
set display=lastline       " Show as much of the line as will fit.
set wildmenu               " Better tab completion in the commandline.
set wildmode=list:longest  " List all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces.
set number                 " Show line numbers.
set wrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set nrformats-=octal       " Remove octal support from 'nrformats'.
set tabstop=4              " Size of a Tab character.
set shiftwidth=0           " Use same value as 'tabstop'.
set softtabstop=-1         " Use same value as 'shiftwidth'.
set clipboard=unnamed      " Use system clipboard
" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" Python integration
set pythonthreedll=python39.dll      " Specify which python dll
let g:UltiSnipsUsePythonVersion = 3  " Tell ultisnips to use py3
set encoding=utf-8
let python_highlight_all=1

" Store temporary files in ~/vimfiles/tmp
set viminfo+=n~/vimfiles/tmp/viminfo
set backupdir=$HOME/vimfiles/tmp/backup
set dir=$HOME/vimfiles/tmp/swap
set viewdir=$HOME/vimfiles/tmp/view
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
if !isdirectory(&dir)       | call mkdir(&dir, 'p', 0700)       | endif
if !isdirectory(&viewdir)   | call mkdir(&viewdir, 'p', 0700)   | endif

" Vim-Plug plugins
call plug#begin('~/vimfiles/plugged')

" NERDtree file browser
Plug 'scrooloose/nerdtree'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

" Powerline (need to install fonts)
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Folding plugin
Plug 'tmhedberg/SimpylFold'

" Search for files
Plug 'kien/ctrlp.vim'

call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox " Set Gruvbox colorscheme
set termguicolors


" Key-bindings

" Easy switching between splits using ctrl 
map <C-J> <C-W>j<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>L<C-W>_

" Easier resizing
nnoremap <leader>- :resize -10<CR>
nnoremap <leader>+ :resize +10<CR>

" Folding with spacebar
nnoremap <space> za
