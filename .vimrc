set background=dark
"colorscheme molokai

syntax enable
syntax on
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
colorscheme desert

:set ruler
:set scrolloff=2
:set nu
:set ts=4
:set expandtab
:set hlsearch
:set shiftwidth=4
:set cindent
:set incsearch

nmap <F4> :!ctags -R<CR><CR>

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

" YCM
Bundle 'Valloric/YouCompleteMe'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nmap <F4> :YcmDiags<CR>
set completeopt=menuone
nnoremap gy :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gu :YcmCompleter GoToImprecise<CR>

" NERD tree
Bundle 'scrooloose/nerdtree'
let NERDChristmasTree=0
let NERDTreeWinSize=25
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F3> :NERDTreeToggle<cr>

" tagbar
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=20
let g:tagbar_autofocus=1
nmap <F5> :Tagbar<CR>
