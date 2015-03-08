"カラー設定"
syntax enable
"テーマ"
colorscheme darkblue
"行表示"
set number
"カッコ表示"
set showmatch
"カッコ表示の時間(0.1秒*数値)
set matchtime=1
"タブ→半角スペース"
set expandtab
"半角スペース数"
set tabstop=2
"検索時の大文字の小文字判別"
set smartcase
"インデント"
"set autoindent"
"行末表示"
set list
"末尾から先頭を再び検索"
set wrapscan
"カーソルの状況表示"
set ruler
"□や○の文字があってもカーソル位置がずれないように"
set ambiwidth=double
"検索ワード入力次点で検索スタート"
set incsearch
"検索ハイライト"
set hlsearch
"折り返し有効"
set wrap
"折り返し無効"
"set nowrap"
"行マタギで移動"
set whichwrap=h,l
"検索で大文字小文字を区別せず"
set ignorecase
"大文字検索だと大文字で"
set smartcase
"コマンドラインの履歴"
set history=1000

set clipboard+=unnamed
set shiftwidth=2
set backspace=indent,eol,start

"行末までヤンク"
nnoremap Y y$

nnoremap + <C-a>
nnoremap - <C-x>

"行末まで表示"
set display=lastline
"補完機能(Ctrl+p, Ctrl+n)における候補表示数"
set pumheight=10

"Markdownをブラウザ
"--------------------------------------------------------------------------
"" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'kana/vim-submode'
NeoBundle 'open-browser.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck "未インストールのプラグインの確認

" markdown
let g:vim_markdown_initial_foldlevel=1
let g:previm_enable_realtime = 1

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

