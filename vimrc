
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set tabstop=2 
set shiftwidth=2
set smartindent
set report=5
set history=500
set hidden
set wildmenu
set wildmode=list:longest
set title
set scrolloff=3
set backupdir=~/.vimtmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vimtmp,~/.tmp,/var/tmp,/tmp
set ruler
set cmdheight=2
set backspace=indent,eol,start
set shortmess=atI
set grepprg=ack
set number
set diffopt+=iwhite

syn on
filetype on
filetype plugin on
filetype indent on

map K :<BS>
map <Leader>k <C-W>k
map <Leader>j <C-W>j
map <Leader>h <C-W>h
map <Leader>l <C-W>l
map <Leader>n :new<CR>
map <Leader>v :vnew<CR>
map <Leader>< :cold<CR>
map <Leader>> :cnew<CR>

map <Leader>g :diffget
map <Leader>G :diffget<CR>
map <Leader>p :diffput
map <Leader>P :diffput<CR>
map <Leader>u :diffupdate<CR>

map <F7> :vertical wincmd f<CR>

inoremap <C-@> <C-N>
nnoremap ' `
nnoremap ` '
nnoremap U 
" Shift buffer viewport by 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map <Leader>= yyp<Esc>:s/./=/g<CR>yykP

" Make folded text and line numbers less visible
:hi Folded ctermbg=darkgrey
:hi LineNr ctermfg=darkgrey

com! Cfg :source ~/.vimrc
com! -nargs=0 EditRC :topleft vs ~/.vim/vimrc

cabbrev rc EditRC

" Filetype-specific options
au FileType cf setlocal noexpandtab ignorecase grepprg=ack\ --type=cf\ -i\ $*
au FileType javascript setlocal noexpandtab
au FileType python setlocal shiftwidth=4 tabstop=4 expandtab

hi Comment ctermfg=DarkGrey

