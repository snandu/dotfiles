"
" vimrc
"

"version 5.6	 " avoid warning for wrong version

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set wildignore=*.o,*.obj

set tabstop=4
set shiftwidth=4
set expandtab    " expand tabs into spaces
set ai           " auto indent
set ic           " ignore case on search
"set vb           " visual bell instead of regular bell

if &t_Co > 1
  syntax on
  " for some reason this is need for Solarized to work properly
  set t_Co=16
endif

"if has("syntax")
"	syntax off
"	set background=dark
"endif

if has("autocmd")
	" c
	autocmd BufRead,BufNewFile *.c,*.C,*.h set cindent

	" python
	"let python_highlight_all = 1

	" verilog
	autocmd BufRead,BufNewFile *.vt,*.v,*.vpl,*.gv set ft=verilog

	" Viva
	autocmd BufRead,BufNewFile *.vx,*.vxh,*.vxctx source ~/.vim/syntax/viva.vim
	autocmd BufRead,BufNewFile *.vx,*.vxctx set ft=viva

    " Makefiles
    autocmd BufRead,BufNewFile Makefile,Makeppfile set noexpandtab 

    " Spec files
    autocmd BufRead,BufNewFile *.spec set ft=verilog
endif

"if has("syntax")
"	syntax on
"endif


map <F7> :if exists("syntax_on") <Bar>
        \  syntax off <Bar>
        \ else <Bar>
        \  syntax enable <Bar>
        \ endif <CR>

set pastetoggle=<F10>

map P4 :!p4 edit %:e!

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Solarized
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" powerline status
" See https://powerline.readthedocs.org/en/latest/usage/other.html#vim-statusline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
