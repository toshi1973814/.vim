set nocompatible               " be iMproved
filetype off                   " required!

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

command! MakeTags !ctags -R .

" use g^] for ambiguous tags

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
"Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
" Plugin 'FuzzyFinder'
" non github repoabolish.vims
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'abolish.vim'
"Plugin 'git://github.com/burnettk/vim-angular.git'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tpope/vim-unimpaired'
"Plugin 'vim-scripts/autotags'
"Plugin 'powerman/vim-plugin-autosess'
"Plugin 'haya14busa/incsearch.vim'
"Plugin 'haya14busa/incsearch-easymotion.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-obsession'
Plugin 'MattesGroeger/vim-bookmarks'
"Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'AndrewRadev/switch.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'

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
"set nofoldenable    " disable folding
" vimの処理が著しく遅くなるためコメントアウト
"autocmd FileType ruby setlocal foldmethod=syntax
"autocmd FileType javascript setlocal foldmethod=syntax

" abbr
cabbr ct ConqueTerm bash
iabbrev dbg debugger
iabbrev dbg debugger
cabbr rex Rextract
cabbr co copen

" map

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
"map <F1> 1Gi# -*- encoding : utf-8 -*-<CR><Esc>^xx
"map <F2> 1Gi-# -*- encoding : utf-8 -*-<CR><Esc>
map <F5> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F6> :source ~/vim_session <cr>     " And load session with F3

"map <F6> :set mouse=a
"map <F7> :set mouse=

set tags+=gems.tags
inoremap <C-F> <C-R>"
let g:ruby_indent_access_modifier_style = 'outdent'
set ambiwidth=double
set tabstop=2
set clipboard=unnamed

" http://vimcasts.org/episodes/the-edit-command/
"let mapleader=','
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
set splitright

"command Cex :e lib/coore/rake/convert_estates | :vs lib/coore/rake/convert_estates/export_estate_csv.rb | :vs lib/coore/rake/convert_estates/convert_export_methods.rb | :vs lib/coore/rake/convert_estates/convert_common_methods.rb

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" http://vim.wikia.com/wiki/Opening_multiple_files_from_a_single_command-line
function! Sp(...)
  if(a:0 == 0)
    sp
  else
    let i = a:0
    while(i > 0)
      execute 'let file = a:' . i
      execute 'sp ' . file
      let i = i - 1
    endwhile
  endif
endfunction
com! -nargs=* -complete=file Sp call Sp(<f-args>)
cab sp Sp

function! Vs(...)
  if(a:0 == 0)
    vs
  else
    let i = a:0
    while(i > 0)
      execute 'let file = a:' . i
      execute 'vs ' . file
      let i = i - 1
    endwhile
  endif
endfunction
com! -nargs=* -complete=file Vs call Vs(<f-args>)
cab vs Vs

"set statusline=[%n]\ %t
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
""let g:syntastic_ruby_checkers = ['mri', 'flog']
"let g:syntastic_ruby_checkers = ['mri']
"let g:syntastic_javascript_checkers = ['eslint']
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

let g:switch_custom_definitions =
  \ [
  \   ['unless ', 'if '],
  \   ['unless(', 'if('],
  \ ]

map <C-n> :NERDTreeToggle<CR>
