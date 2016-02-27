" Description: collection of small personal plugins
" Author: Colin Bullock <github.com/cmbullock>

if(exists('g:loaded_cmb') && g:loaded_cmb)
  finish
endif

let g:loaded_cmb = 1

" Make grep better
com! -nargs=+ Grep :silent grep! <args> | :redraw!
au QuickfixCmdPost grep cope
au QuickfixCmdPost grep setlocal nowrap

cabbrev gr Grep

" Transparently edit GPG encrypted files
augroup encrypted
	au!

	" Dont write unencrypted stuff to various places
	au BufReadPre,FileReadPre *.gpg set viminfo=
	au BufReadPre,FileReadPre *.gpg set noswapfile
	au BufReadPre,FileReadPre *.gpg set noundofile
	au BufReadPre,FileReadPre *.gpg set nobackup

	" Change to binary mode
	au BufReadPre,FileReadPre *.gpg set bin
	au BufReadPre,FileReadPre *.gpg let ch_save = &ch | set ch=2

	" Decrypt
	au BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

	" Switch back to normal mode while editing
	au BufReadPost,FileReadPost *.gpg set nobin
	au BufReadPost,FileReadPost *.gpg let &ch = ch_save | unlet ch_save
	au BufReadPost,FileReadPost *.gpg exec ":doautocmd BufReadPost " . expand("%:r")
	au BufReadPost,FileReadPost *.gpg redraw!

	" Encrypt before writing
	au BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2> /dev/null
	" Undo encryption in buffer after writing
	au BufWritePost,FileWritePost *.gpg u
augroup END

" Support for running specs
let s:ruby_spec_cmd = "!foreman run rspec {spec}"

function! RunSpecFile()
	if(&ft == 'ruby')
		if(match(expand('%'), '_spec.rb$') != -1)
			let l:spec = @%
			call SetLastSpec(s:ruby_spec_cmd, l:spec)
			call RunSpec(s:ruby_spec_cmd, l:spec)
		else
			let l:spec = 'spec/' . substitute(expand('%'), '\.rb$', '_spec.rb', '')
			if(filereadable(l:spec))
				call SetLastSpec(s:ruby_spec_cmd, l:spec)
				call RunSpec(s:ruby_spec_cmd, l:spec)
      else
        let l:spec = substitute(l:spec, '^spec/app', 'spec', '')
        if(filereadable(l:spec))
          call SetLastSpec(s:ruby_spec_cmd, l:spec)
          call RunSpec(s:ruby_spec_cmd, l:spec)
        endif
			endif
		endif
	endif
endfunction

function! RunSpec(cmd, spec)
	exec substitute(a:cmd, '{spec}', a:spec, 'g')
endfunction

function! SetLastSpec(cmd, spec)
	let s:last_spec_cmd = a:cmd
	let s:last_spec = a:spec
endfunction

function! RunLastSpec()
	call RunSpec(s:last_spec_cmd, s:last_spec)
endfunction

