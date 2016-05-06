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

" markdown記法のURL(\mu)
vnoremap <leader>mu ygvs[] (<c-r>")<esc>?[]<cr>a

"行末まで表示"
set display=lastline
"補完機能(Ctrl+p, Ctrl+n)における候補表示数"
set pumheight=10
" insertモードから抜ける
inoremap <silent> jj <ESC>


map <silent> <leader>e :NERDTreeToggle<cr>
""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" 日本語:helpドキュメント
NeoBundle 'vim-jp/vimdoc-ja'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'int3/vim-extradite'

" 罫線描画
NeoBundle 'vim-scripts/DrawIt'

" コマンド補完
NeoBundle 'thinca/vim-ambicmd'
cnoremap <expr> <Space> ambicmd#expand("\<Space>")
cnoremap <expr> <CR>    ambicmd#expand("\<CR>")

" インデントハイライト(\ig) ------------------------------------- 
NeoBundle 'nathanaelkane/vim-indent-guides'
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 2
" ---------------------------------------------------

" カーソル移動(\\w or \\b)
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

" テキスト編集"
NeoBundle 't9md/vim-textmanip'
" 選択したテキストの移動
nmap <CR>   <Plug>(textmanip-blank-below)
xmap <CR>   <Plug>(textmanip-blank-below)

xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

xmap <D-K> <Plug>(textmanip-duplicate-up)
xmap <D-J> <Plug>(textmanip-duplicate-down)
xmap <D-H> <Plug>(textmanip-duplicate-left)
xmap <D-L> <Plug>(textmanip-duplicate-right)

xmap  <Up>    <Plug>(textmanip-move-up-r)
xmap  <Down>  <Plug>(textmanip-move-down-r)
xmap  <Left>  <Plug>(textmanip-move-left-r)
xmap  <Right> <Plug>(textmanip-move-right-r)

nmap <C-s> <Plug>(textmanip-toggle-mode)
xmap <C-s> <Plug>(textmanip-toggle-mode)

" 選択範囲のワードで検索
NeoBundle 'thinca/vim-visualstar'

" ファイルパスコピー
NeoBundle 'vim-scripts/copypath.vim'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'open-browser.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" The Silver Searcher （高速検索システム）
NeoBundle 'rking/ag.vim'

"" neocomplcache --------------------------------------
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ------------------------------


call neobundle#end()

" Required
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


