
"         GGGGGGGGGGGGG               AAA               
"      GGG::::::::::::G              A:::A              
"    GG:::::::::::::::G             A:::::A             
"   G:::::GGGGGGGG::::G            A:::::::A            
"  G:::::G       GGGGGG           A:::::::::A           
" G:::::G                        A:::::A:::::A          
" G:::::G                       A:::::A A:::::A         
" G:::::G    GGGGGGGGGG        A:::::A   A:::::A        
" G:::::G    G::::::::G       A:::::A     A:::::A       
" G:::::G    GGGGG::::G      A:::::AAAAAAAAA:::::A      
" G:::::G        G::::G     A:::::::::::::::::::::A     
"  G:::::G       G::::G    A:::::AAAAAAAAAAAAA:::::A    
"   G:::::GGGGGGGG::::G   A:::::A             A:::::A   
"    GG:::::::::::::::G  A:::::A               A:::::A  
"      GGG::::::GGG:::G A:::::A                 A:::::A 
"         GGGGGG   GGGGAAAAAAA                   AAAAAAA
                                                      

" GitHub: https://github.com/Giammy2094  


"******************** General Settings *********************
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
set splitbelow			   " Open the new split below
set splitright			   " Open the new split below
set nobackup			   " Don't use backup
set nowritebackup		   " Don't write backup
set hidden				   " Avoid issues with TextEdit
set cmdheight=2			   " Give more space for displaying messages
set updatetime=300         " Longer updatetime (default is 4000 ms) leads to delays
set shortmess+=c           " Don't pass messages to ins-completion-menu

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
set signcolumn=number

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" Store temporary files in ~/vimfiles/tmp
set viminfo+=n~/vimfiles/tmp/viminfo
" set backupdir=$HOME/vimfiles/tmp/backup
set dir=$HOME/vimfiles/tmp/swap
set viewdir=$HOME/vimfiles/tmp/view
" if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
if !isdirectory(&dir)       | call mkdir(&dir, 'p', 0700)       | endif
if !isdirectory(&viewdir)   | call mkdir(&viewdir, 'p', 0700)   | endif


"******************** Python integration *******************************
set pythonthreedll=python39.dll      " Specify python dll
set encoding=utf-8
let python_highlight_all=1

"******************** Vim-Plug *****************************************
" Install Vim-Plug
if empty(glob('~/vimfiles/autoload/plug.vim'))
  silent !curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-Plug plugins
call plug#begin('~/vimfiles/plugged')

" Colorscheme
Plug 'sainnhe/sonokai'
" NERDtree file browser
Plug 'scrooloose/nerdtree'
" Airline
Plug 'vim-airline/vim-airline'
" Folding plugin
Plug 'tmhedberg/SimpylFold'
" Linting
Plug 'dense-analysis/ale'
" Add closing brackets
Plug 'jiangmiao/auto-pairs'
" Git support
Plug  'tpope/vim-fugitive'
" Add fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" LaTex support
Plug 'lervag/vimtex'
" Vim Wiki
Plug 'vimwiki/vimwiki'

call plug#end()


"******************** Package settings ************************************
"Colorschemes
if has('termguicolors')
  set termguicolors
endif
let g:sonokai_style = 'maia'
let g:sonokai_better_performance = 1
let g:airline_theme = 'sonokai'
colorscheme sonokai

" ALE settings
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
	  \}
" Airline uses Powerline 
let g:airline_powerline_fonts = 1
set noshowmode
"******************** Remapped key-bindings *******************************
" Easy switching between splits using ctrl in normal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Easy switching between splits using ctrl in terminal 
tmap <C-J> <C-W><C-J>
tmap <C-K> <C-W><C-K>
tmap <C-L> <C-W><C-L>
tmap <C-H> <C-W><C-H>
" Easier resizing
nnoremap <leader>- :resize -10<CR>
nnoremap <leader>+ :resize +10<CR>
" Folding with spacebar
nnoremap <space> za
" Fugitive remap
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" NERDTree remap
nnoremap <C-n> :NERDTreeToggle<CR>
" Coc remap
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Remap <C-f> and <C-b> for scroll float windows/popups.
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
