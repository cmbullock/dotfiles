" Description: collection of small personal plugins
" Author: Colin Bullock <github.com/cmbullock>

if(exists('g:loaded_cmb') && g:loaded_cmb)
  finish
endif

let g:loaded_cmb = 1

com! -nargs=+ Grep :silent grep! <args> | :redraw!
au QuickfixCmdPost grep cope
au QuickfixCmdPost grep setlocal nowrap

cabbrev gr Grep

