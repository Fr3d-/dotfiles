""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
"set list "Show invisible characters
"set listchars=tab:▸\ ,eol:¬ "Which are tabs and end of lines.

set encoding=utf-8

set number                     " Show current line number
"set relativenumber             " Show relative line numbers

set laststatus=2 " Always show statusline, also shows the powerline.

" So we don't have to press escape twice to exit INSERT mode.
" While still being able to use our leader key.
set timeoutlen=1000
set ttimeoutlen=0

" Close preview window after completion
autocmd CompleteDone * pclose

let mapleader = "," " Our mapleader is ,

" Assigning env variables
let mydevice=$MYDEVICE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Hotkeys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>ne :NERDTreeToggle<cr>
autocmd Filetype python nnoremap <leader>b :update<Bar>execute '!clear && python3.4 '.shellescape(@%, 1)<CR>
autocmd FileType tex nnoremap <leader>b :update<CR>:Latexmk<CR>
autocmd FileType cpp nnoremap <leader>b :update<Bar>execute '!clear && make && ./out'<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors, in bash -> export TERM='xterm-256color'
set t_Co=256
color wombat256mod

" :highlight LineNr ctermfg=darkgrey ctermbg=black
" :highlight CursorLineNr ctermfg=lightgrey ctermbg=black

let g:airline_powerline_fonts = 1

if mydevice == "main"
	let g:airline_theme='bubblegum'
elseif 	mydevice == "laptop"
	let g:airline_theme='molokai'
endif

" https://github.com/vim-airline/vim-airline/issues/1125
" Makes sure airline doesn't get screwed because of preview windows.
let g:airline_exclude_preview = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Add Syntastic plugin here "
Plugin 'scrooloose/syntastic'

Plugin 'fsharp/vim-fsharp'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/.ycm_extra_conf.py"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.x64 set syntax=ia64
" This doesn't work if it's put higher up.
set noshowmode
