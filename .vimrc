set nocompatible               " be iMproved
 filetype off                   " required!

 "set rtp+=~/.vim/bundle/vundle/
 "call vundle#rc()
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle
 " required!
 Plugin 'gmarik/vundle'

 " My Plugins here:
 "
 " original repos on github
 Plugin 'tpope/vim-fugitive'
 Plugin 'Lokaltog/vim-easymotion'
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 Plugin 'tpope/vim-rails.git'
 " vim-scripts repos
 Plugin 'L9'
 " Plugin 'FuzzyFinder'
 " non github repoabolish.vims
 Plugin 'git://git.wincent.com/command-t.git'
 Plugin 'vim-ruby/vim-ruby'
 Plugin 'tpope/vim-haml.git'
 Plugin 'scrooloose/nerdcommenter'
 Plugin 'kien/ctrlp.vim'
 Plugin 'abolish.vim'
 Plugin 'git://github.com/burnettk/vim-angular.git'
 " Bundle 'bootleq/vim-ruby-enccomment'
 " ...
 call vundle#end()

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
execute pathogen#infect()

syntax on

" set
set expandtab
set shiftwidth=2
set pastetoggle=<f5>
set wim=list:longest
set nu
set nobackup
set nowritebackup
set noswapfile
"set foldenable

" abbr
cabbr ct ConqueTerm bash
iabbrev dbg debugger
iabbrev dbg debugger
cabbr rex Rextract
cabbr co copen

" map
map <F4> odebugger<Esc>:w

" others

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"set backupdir=~/tmp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''
"map <F3> :CtrlP
map <F1> 1Gi# -*- encoding : utf-8 -*-<CR><Esc>^xx
map <F2> 1Gi-# -*- encoding : utf-8 -*-<CR><Esc>
map <F6> :set mouse=a
map <F7> :set mouse=

set tags+=gems.tags
inoremap <C-F> <C-R>"
let g:ruby_indent_access_modifier_style = 'outdent'
set ambiwidth=double
set tabstop=2
