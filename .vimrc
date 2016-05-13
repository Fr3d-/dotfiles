""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
"set list "Show invisible characters
"set listchars=tab:▸\ ,eol:¬ "Which are tabs and end of lines.

set number                     " Show current line number
"set relativenumber             " Show relative line numbers

set laststatus=2 " Always show statusline, also shows the powerline.

" So we don't have to press escape twice to exit INSERT mode.
" While still being able to use our leader key.
set timeoutlen=1000
set ttimeoutlen=0

" Close preview window after completion
autocmd CompleteDone * pclose

let mapleader = "," " Our mapldear is ,

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
let g:airline_theme='molokai'

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

Plugin 'latex-box-team/latex-box'
Plugin 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/.ycm_extra_conf.py"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This doesn't work if it's put higher up.
set noshowmode
