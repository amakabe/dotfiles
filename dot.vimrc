set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'tsaleh/vim-align'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'bbommarito/vim-slim'
Bundle 'unite-colorscheme'
Bundle 'h1mesuke/unite-outline'

if &encoding !=# 'utf-8'
  set encoding=japan
endif

set fileencoding=japan
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      let &encoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif


set autoindent
set backspace=2
set cmdheight=1
set nobackup
set directory=$HOME/.vim/swap
set noscrollbind
set wildmenu
set hidden
set foldmethod=marker
set wildmode=longest,list
set ambiwidth=single
set scrolloff=100
set iminsert=0 imsearch=0
set ignorecase
set noincsearch
set smartcase
set wrapscan
set number
set hlsearch
set listchars=tab:*-,extends:~,trail:_
set list
set ruler
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set showmatch
set showmode
set showcmd
set novisualbell
set laststatus=2
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %l,%c%V%8P
set t_Co=256

filetype plugin on
syntax on

highlight SpecialKey ctermfg=7
highlight LineNr ctermfg=7
highlight Pmenu ctermfg=0 ctermbg=7
highlight PmenuSel cterm=underline ctermfg=0 ctermbg=7
highlight ZenkakuSpace ctermbg=white
match ZenkakuSpace /¡¡/

"let g:neocomplcache_enable_at_startup = 1

autocmd BufWritePost * :call AddExecmod()
function! AddExecmod()
    let line = getline(1)
    if strpart(line, 0, 2) == "#!"
        call system("chmod +x ". expand("%"))
    endif
endfunction

cmap <c-x> <c-r>=expand('%:p:h')<cr>/

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"

nnoremap j gj
nnoremap k gk
nnoremap q <Nop>

nnoremap <silent> ;; :<C-u>Unite buffer<CR>
nnoremap <silent> ;f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ;r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ;m :<C-u>Unite file_mru<CR>
nnoremap <silent> ;a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ;o :<C-u>Unite outline<CR>

nmap <silent> eu :set fenc=utf-8<CR>
nmap <silent> ee :set fenc=euc-jp<CR>
nmap <silent> es :set fenc=cp932<CR>
nmap <silent> eru :e ++enc=utf-8 %<CR>
nmap <silent> ere :e ++enc=euc-jp %<CR>
nmap <silent> ers :e ++enc=cp932 %<CR>
nmap <Leader>a :%s/\v {1,}$//g<CR>
nmap <Leader>b :source $MYVIMRC<CR>

