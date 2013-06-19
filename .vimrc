set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'tpope/vim-haml.git'
 Bundle 'scrooloose/nerdcommenter'
 " ...

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
set foldenable

" abbr
cabbr ct ConqueTerm bash
iabbrev dbg debugger
iabbrev dbg debugger
cabbr rex Rextract

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
    " vim-fuzzyfinder plugin
    map <Leader>t :FufFile<Enter>
    " start recursive search with a comma. see help for 'fuf-abbreviation'
    let g:fuf_abbrevMap = {
            \   "^," : [
            \     "**/",
            \   ],
            \ }
"set backupdir=~/tmp
