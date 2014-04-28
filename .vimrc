" neobundle.vim
set nocompatible

filetype plugin indent off
 
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
 
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/vim-scripts/taglist.vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'git://github.com/vim-scripts/TwitVim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'derekwyatt/vim-scala'
"NeoBundle 'kakkyz81/evervim'
NeoBundle 'github: https://github.com/tpope/vim-fugitive'
 
filetype plugin on
filetype indent on

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files bufferfile_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" Unite-grep
nnoremap <silent> ,ug :Unite grep:%:-iHRn<CR>

" ===========
" powerline
" ===========
" let g:Powerline_symbols = 'fancy'

" ===========
" neocomplcache
" ===========
let g:neocomplcache_enable_at_startup = 1

""""" Scala用設定 """"""""
" ファイルタイプの追加
augroup filetypedetect
autocmd! BufNewFile,BufRead *.scala setfiletype scala
autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END
"vi互換の動きにしない
"" set nocompatible

"左右のカーソル移動で行間移動可能にする。
" set whichwrap=b,s,<,>,[,]

" バッファをキーで移動
 " map <F2> <ESC>:bp<CR>
 " map <F3> <ESC>:bn<CR>
"
"colorscheme desert

 " 検索を循環させない
set nowrapscan

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" 対応括弧の瞬間強調時間
set matchtime=3

" 行番号表示
set number

" 見た目で行移動
" nnoremap j gj
" nnoremap k gk

" 削除でレジスタに格納しない(ビジュアルモードでの選択後は格納する)
" nnoremap x "_x
" nnoremap dd "_dd

" カラー設定
"colorscheme solarized
syntax on

" font
"set guifont=MS_Gothic:h10:cSHIFTJIS

" window size
"set lines=40
"set columns=120

"水平タブ系の設定==============================================
"デフォルト設定。結局runtime/indentの設定のほうで、ファイルごとに切り替える
" タブとか改行を表示する
"set list

" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
" set listchars=tab:>-,extends:<,trail:-,eol:\  

"標準タブは4
set tabstop=2
set shiftwidth=2
set softtabstop=0


" tabをスペースに置換する
"set expandtab

"自動的にインデントする
"set autoindent
"実はスマートはウザかったりする。
"set smartindent
set cindent

"空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>


" 文字コード関連
" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp
" 改行コードの解釈優先順位
set fileformats=unix,dos

" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8
" 内部の改行コード
set fileformat=unix



" ==================================================================

"全角スペースを視覚化
"
"if has('syntax')
"    syntax enable
"    function! ActivateInvisibleIndicator()
"        highlight ZenkakuSpace cterm=underline ctermfg=darkgrey
"        gui=underline guifg=#FF0000
"        match ZenkakuSpace /　/
"    endfunction
"    augroup InvisibleIndicator
"        autocmd!
"        autocmd BufEnter * call ActivateInvisibleIndicator()
"    augroup END
"endif


" クリップボード関係=========================================
" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed
"set clipboard=unnamed,autoselect
"
" バッファ関連=====================================================
" 編集中でもバッファを切り替えれるようにしておく
set hidden
"バッファ一覧ショートカット→バッファ番号で移動
nmap gb :ls<CR>:buf 


" ステータスエリア関係
" ステータスのところにファイル情報表示
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 
set laststatus=2 

" ルーラーを表示
set ruler
set title

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block


" escでハイライトをオフ
"nnoremap <silent> <ESC> <ESC>:noh<CR>
" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
"noremap <CR> i<CR><ESC>

" 挿入モードでctrl+T二回うちで現在時刻挿入
" imap <silent> <C-T><C-T>
"<C-R>=strftime("%H:%M:%S")<CR>
"

" diffで-------を表示しない
":set diffopt-=filler
