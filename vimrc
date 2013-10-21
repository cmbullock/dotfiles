set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set cm=blowfish
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
set number
set diffopt+=iwhite
set clipboard=unnamed
set autoread
set showmatch
set list
"set listchars=tab:▸\ ,eol:¬,trail:▫,extends:#,nbsp:▫
set listchars=tab:\ \ ,eol:¬,trail:▫,extends:#,nbsp:▫
set noexpandtab
set mouse=a
set tw=0

syn on
filetype on
filetype plugin on
filetype indent on

imap kj <ESC>
imap jk <ESC>
map K :<BS>
map Y y$
map <Leader>k <C-W>k
map <Leader>j <C-W>j
map <Leader>h <C-W>h
map <Leader>l <C-W>l
map <Leader>n :new<CR>
map <Leader>v :vnew<CR>
map <Leader>< <C-W><
map <Leader>> <C-W>>

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

com! Cfg :source ~/.vimrc
com! -nargs=0 EditRC :topleft vs ~/.vim/vimrc
cabbrev rc EditRC

" Filetype-specific options
au FileType javascript setlocal noexpandtab
au FileType python setlocal shiftwidth=4 tabstop=4 expandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} setlocal filetype=ruby

let g:is_posix = 1

let NERDTreeWinSize=50
let NERDTreeShowHidden=1
com! NERDTreeSuperToggle :if(exists('b:NERDTreeType')) | NERDTreeToggle | else | NERDTreeFocus | endif
map <Leader>t :NERDTreeSuperToggle<CR>
" Close if only nerdtree is left open
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --ignore=log\ --ignore=vendor
	let g:grepprg = "ag --nogroup --column --ignore='^(log|vendor)'"
	let g:findprg = "ag --nogroup --column --ignore='^(log|vendor)'"
	let g:ctrlp_user_command = {
		\ 'types': {
			\ 1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
			\ 2: ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'],
		\ },
		\ 'fallback': 'ag %s --files-with-matches --nocolor -g ""'
	\ }
endif

" Session handling
au VimLeave * if(exists(':NERDTreeClose')) | NERDTreeClose | endif
au VimLeave * mksession! .vimsession

au VimEnter * if(filereadable('.vimsession') && argc() == 0) | source .vimsession | endif

colorscheme distinguished
hi StatusLineNC ctermbg=233
hi LineNr ctermbg=233
hi Comment ctermbg=0

