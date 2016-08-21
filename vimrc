if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set runtimepath+=/sbin " YouCompleteMe setup calls /sbin/ldconfig
endif

" enable submodule support
"let g:neobundle#types#git#enable_submodule = 1
let g:neobundle#install_process_timeout = 1500
"let g:ycm_python_binary_path = '/usr/bin/python'

set rtp+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'unix' : './install.py --tern-completer --clang-completer --system-libclang',
      \    },
      \ }
NeoBundle 'vim-scripts/a.vim', { 'rev' : 'tags/2.14' }
NeoBundle 'vim-scripts/The-NERD-Commenter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'craigemery/vim-autotag'
NeoBundle 'nvie/vim_bridge'
NeoBundle 'nvie/vim-rst-tables'
NeoBundle 'ternjs/tern_for_vim', {
      \ 'build' : {
      \     'unix' : 'npm install',
      \    },
      \ }
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'jparise/vim-graphql'
NeoBundle 'scrooloose/syntastic'


"NeoBundle 'vim-scripts/CycleColor'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


if has("gui_running")
    colorscheme BlackSea
else
    colorscheme evening
endif

" enable syntax highlighting
syn on

" filetypes
filetype plugin on
filetype indent on

" indent and tab behaviour
set sw=4
set tabstop=4
set smarttab
set expandtab

" visual bell
set visualbell

" remove toolbar
set guioptions-=T

" always shob tablist
set showtabline=2

" change to buffers directory
"set autochdir

set hlsearch

set clipboard=unnamed

function! Trim()
  :mark z
  :%s/\s\+$//eg
  :normal g`z
endf

au BufWritePre * call Trim()
au FileType make setlocal noexpandtab

set wildmenu

" always show the statusline
set laststatus=2

" add .hpp to sort sequence
let g:netrw_sort_sequence = "[\/]$,\.h$,\.hpp$,\.c$,\.cpp$,\.py$,*,\.o$,\.obj$,\.pyc$,\.info$,\.swp$,\.bak $,\~$"
let g:xptemplate_vars="$author=Klemens Senn&$email=klemens.senn@waltzingatoms.at&$SParg="

" auto close options when exiting insert mode
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone

"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
"let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

" C++
au BufNewFile,BufRead *.cxx,*.c++,*.hh,*.hxx,*.hpp,*.ipp,*.moc,*.tcc,*.inl,*.ixx setf cpp
if has("fname_case")
  au BufNewFile,BufRead *.C,*.H setf cpp
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" map CTRL-Space to omni completion
inoremap <C-space> <C-x><C-o>

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" remap leader to space
let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" copy and paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" map tab navigation
map <C-l> gt
map <C-h> gT
nn <silent> <M-Right> :if tabpagenr() == tabpagenr("$")\|tabm 0\|el\|exe "tabm ".tabpagenr()\|en<CR>
nn <silent> <M-Left> :if tabpagenr() == 1\|exe "tabm ".tabpagenr("$")\|el\|exe "tabm ".(tabpagenr()-2)\|en<CR>

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

set backspace=2 " make backspace work like most other apps (indent,eol,start)
set hidden " allow buffer switching on unsaved buffers
set ruler " show line and column number
set noswapfile nobackup nowritebackup autoread  " no backups and auto-read
set linebreak

let tern#is_show_argument_hints_enabled=1

" settings for syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn



