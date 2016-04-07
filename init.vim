" *********************************************************************
" Description: Neovim Custom Configuration
" Version: 4.0
" Author: Felipe Apostol <flipjs.io@gmail.com>
" Date: 27 February 2016
" *********************************************************************

filetype off

" ------------ Vim-Plug Configuration - must be on top ------------ "

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'benekastah/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'sjl/gundo.vim'
Plug 'rizzatti/dash.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'mattn/emmet-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'wavded/vim-stylus'
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/vim-easy-align'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanss/vim-hackernews'
Plug 'joshhartigan/vim-reddit'
Plug 'majutsushi/tagbar'
Plug 'tommcdo/vim-exchange'
Plug 'flipjs/vim-operator-highlight'
Plug 'tpope/vim-abolish'
Plug 'svermeulen/vim-easyclip'
Plug 'bronson/vim-visual-star-search'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'ap/vim-buftabline'
Plug 'spiiph/vim-space'
Plug 'digitaltoad/vim-jade'
Plug 'posva/vim-vue'
Plug 'vim-scripts/TwitVim'
Plug 'terryma/vim-multiple-cursors'
Plug 'cakebaker/scss-syntax.vim'
Plug 'habamax/vim-skipit'
Plug 'mustache/vim-mustache-handlebars'
Plug 'skwp/greplace.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'maciakl/vim-neatstatus'
Plug 'tomtom/tcomment_vim'
call plug#end()

syntax on
filetype plugin indent on


" ---------------------- Custom Configuration ----------------------- "

" Ensure vim-sensible is installed, for set defaults

" macvim only (or any gui vim?)
set guifont=Source\ Code\ Pro\ for\ PowerLine:h16
set linespace=4

" vim color theme
set t_Co=256
colorscheme monokai

" override colorscheme monokai background color
highlight Normal guibg=black guifg=white
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" no error bell, no visual bell
set noeb vb t_vb=

set nomodeline

if !has('nvim')
  set encoding=utf-8
endif

" may be overridden in .editorconfig
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab """ tab is space

set number
" set relativenumber
set cursorline
set hidden
set showmatch
set showmode
set lazyredraw

set ignorecase
set smartcase
set gdefault

set wrap
set linebreak
set breakindent
set showbreak=»\
" set textwidth=79
set formatoptions=qrn1
set nolist
set listchars=tab:▸\ ,eol:¬
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=79
set nohlsearch

set splitbelow
set splitright

set mouse=a
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

" change cursorline and matchparen colors (cterm only)
highlight CursorLine ctermbg=233
highlight MatchParen cterm=none ctermbg=201 ctermfg=white
" change matchparen colors to match cursorline on insert mode
augroup GroupMatchParen
  autocmd!
  autocmd InsertEnter * highlight MatchParen ctermbg=233 ctermfg=15
  autocmd InsertLeave * highlight MatchParen ctermbg=201 ctermfg=white
augroup END

" get rid of ugly split borders
highlight vertsplit ctermfg=black ctermbg=black
highlight vertsplit guifg=black guibg=black


" --------------------------- Map Leader ---------------------------- "

" mapleader is comma
let mapleader = ","
" get comma functionality back using ,,
nnoremap ,, ,


" ------------------------- Plugin Settings ------------------------- "

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

augroup GroupNeomake
  autocmd!
  autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ?
      \ ['jshint', 'jscs'] : findfile('.eslintrc', '.;') != '' ?
      \ ['eslint'] : ['standard']
augroup END

" Greplace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Mustache-Handlebars
let g:mustache_abbreviations = 1

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1

" Typescript
let g:typescript_indent_disable = 1
let g:typescript_compiler_options = '-sourcemap'
augroup GroupQuickFix
  autocmd!
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
augroup END

" Easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipShareYanks = 1
" do not autoformat pasted text
let g:EasyClipAutoFormat = 0
" disable this feature, see settings at the top (search modern editors)
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0

" Operator-highlight (flipjs forked version)
let g:ophigh_color = 196
let g:ophigh_color_gui = "#FF0000"

" Ag.vim
set runtimepath^=~/.config/nvim/plugged/ag

" CtrlP
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
let g:ctrlp_match_window_reversed = 0
" search by filename - can be toggled on/off by pressing <c-d> inside the prompt
let g:ctrlp_by_filename = 1

" Autoformat
let g:formatdef_standard_js = '"standard-format --stdin"'
let g:formatters_javascript = ['standard_js']

" YouCompleteMe
set complete=.,b,u,]
set wildmode=longest,list,full
set completeopt=menu
augroup GroupCompleteDone
  autocmd!
  autocmd CompleteDone * pclose
augroup END
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'erlang' : [':'],
  \ }

" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <c-g> :TmuxNavigatePrevious<cr>

" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': [81, 208, 148, 197],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'html.handlebars': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'php': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Gundo
set undodir=~/.config/nvim/undohistory
set undofile
set history=1000
set undolevels=1000
let g:gundo_width = 30


" ---------------------------- Functions ---------------------------- "

function! FileHeader()
let s:line=line(".")
call setline(s:line,  "/***********************************************************************")
call append(s:line,   " * Description - ")
call append(s:line+1, " * Author - Felipe Apostol")
call append(s:line+2, " * Date - ".strftime("%d %b %Y"))
call append(s:line+3, " ***********************************************************************/")
unlet s:line
endfunction

function! LineHeader(width, word)
    let a:inserted_word = ' ' . a:word . ' '
    let a:word_width = strlen(a:inserted_word)
    let a:length_before = (a:width - a:word_width) / 2
    let a:hashes_before = repeat('-', a:length_before)
    let a:hashes_after = repeat('-', a:width - (a:word_width + a:length_before))
    let a:hash_line = repeat('-', a:width)
    let a:word_line = a:hashes_before . a:inserted_word . a:hashes_after . ' //'

    " :put =a:hash_line
    :put =a:word_line
    " :put =a:hash_line
endfunction

function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction


" -------------------------- Autocommands --------------------------- "

augroup JavaScript
  autocmd!
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!clear && node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rb :!clear && babel-node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rl :!clear && jshint %<cr>
augroup END

augroup TypeScript
  autocmd!
  autocmd FileType typescript nnoremap <buffer> <leader>rr :!clear && tsc %<cr>
  " insert empty line between brackets on <enter> and explicit <tab>
  autocmd FileType typescript inoremap <buffer> {<cr> {<cr>}<c-o>O<tab>
  autocmd FileType typescript inoremap <buffer> [<cr> [<cr>]<c-o>O<tab>
  autocmd FileType typescript inoremap <buffer> (<cr> (<cr>)<c-o>O<tab>
augroup END

augroup CoffeeScript
  autocmd!
  autocmd FileType coffee nnoremap <buffer> <leader>rr :CoffeeRun<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rl :!clear && coffeelint %<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rc :CoffeeCompile vert<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rw :CoffeeWatch vert<cr>
augroup END

augroup PHP
  autocmd!
  autocmd FileType php nnoremap <buffer> <leader>rr :!clear && php %<cr>
augroup END

augroup Ruby
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <leader>rr :!clear && ruby %<cr>
augroup END

augroup Python
  autocmd!
  autocmd FileType python nnoremap <buffer> <leader>rr :!clear && python3 %<cr>
  autocmd FileType python nnoremap <buffer> <leader>r2 :!clear && python2 %<cr>
augroup END

augroup Elixir
  autocmd!
  autocmd FileType elixir nnoremap <buffer> <leader>rr :!clear && elixir %<cr>
  autocmd FileType elixir nnoremap <buffer> <leader>re :!clear && mix test<cr>
augroup END

augroup Handlebars
  autocmd!
  autocmd BufNewFile,BufRead *.hbs set filetype=html.handlebars
augroup END


" -------------------------- Abbreviations -------------------------- "

" Note: some abbreviations are defined inside ftplugin directory
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
inoreabbrev funciton function
inoreabbrev functon function
" kke is being used as a map to equal sign, use abbrev below for affected words
inoreabbrev bkp bookkeep
inoreabbrev Bkp Bookkeep
inoreabbrev BKP BOOKKEEP
inoreabbrev bkping bookkeeping
inoreabbrev Bkping Bookkeeping
inoreabbrev BKPING BOOKKEEPING


" ------------------------- for iTerm only -------------------------- "

" if iTerm detected, change default
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end


" -------------------- Plugin-dependent Mapping --------------------- "

" Skipit
imap <c-f>l <Plug>SkipItForward
imap <c-f>L <Plug>SkipAllForward
imap <c-f>h <Plug>SkipItBack
imap <c-f>H <Plug>SkipAllBack
nmap <c-f> i<c-f><c-f>

" Visual-star-search
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<cr>
vnoremap <leader>* :<c-u>call VisualStarSearchSet('/', 'raw')<cr>:call ag#Ag('grep', '--literal ' . shellescape(@/))<cr>

" Easyclip
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
" easyclip shadows m, rebind m to gm
nnoremap gm m

" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

" CtrlP
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>fr :CtrlPMRU<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>fc :CtrlPCurWD<cr>

" Tagbar
nnoremap <leader>tb :TagbarToggle<cr>

" Gundo
nnoremap <leader>uu :GundoToggle<cr>
nnoremap <leader>ue :earlier 1f<cr>
nnoremap <leader>ul :later 1f<cr>

" Autoformat
noremap <c-u> :Autoformat<cr>

" Emmet
imap <c-e> <c-y>,

" Dash
nmap <leader>hh <Plug>DashSearch

" Vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ------------------------ Function Mapping ------------------------- "

" file heading
nnoremap <leader>hf mz:execute FileHeader()`zjA
" line heading
nnoremap <leader>hl :call LineHeader(67, '
" delete empty buffers
nnoremap <leader>ee :call DeleteEmptyBuffers()<cr>


" ------------------------- Custom Mapping -------------------------- "

" edit and source .vimrc
nnoremap <leader>ve :edit $MYNVIMRC<cr>
nnoremap <leader>vs :source $MYNVIMRC<cr>
nnoremap <leader>vu :source $HOME/.config/nvim/unmap.vim<cr>
nnoremap <leader>vj :edit $HOME/.config/nvim/UltiSnips/javascript/javascript.snippets<cr>
nnoremap <leader>vr :edit $HOME/.config/nvim/UltiSnips/javascript/javascript-react.snippets<cr>
nnoremap <leader>vp :edit $HOME/.config/nvim/UltiSnips/php.snippets<cr>
" ctrl-s to save
noremap <c-s> :update<cr><esc>
vnoremap <c-s> <esc>:update<cr><esc>
inoremap <c-s> <esc>:update<cr><esc>
" close current buffer
nnoremap <leader>dd :bd<cr>
" save current buffer
nnoremap <leader>ww :w<cr>
" close saved buffer(s)
nnoremap <leader>qq :q<cr>
" apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>
" remap ^ $
nnoremap H ^
nnoremap L $
vnoremap L g_
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" jj is escape
inoremap jj <esc>
" make copy & paste behave like in modern editors
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" share data between concurrent vim instances
vnoremap <leader>yy :w! /tmp/vimshare<cr>
nnoremap <leader>pp :r! cat /tmp/vimshare<cr>
" highlight last inserted text
nnoremap gV `[v`]
" stay on visual mode when indenting
vnoremap < <`[v`]
vnoremap > >`[v`]
" bring whole block to column 0
vnoremap <leader>hh 99<
" destroy all lines except lines with word under cursor
nnoremap <leader>di :v/<c-r><c-w>/d<cr>gg
" destroy all lines except lines with whats in yanks current buffer
nnoremap <leader>dy :v/<c-r>"/d<cr>gg
" select all text
nnoremap <leader>aa ggVG
" visual warning when text past 79 column
match ErrorMsg '\%>79v.\+'
nnoremap <leader>le :match ErrorMsg '\%>79v.\+'<cr>
nnoremap <leader>ln :match none<cr>
" show error window
nnoremap <leader>lo :lopen<cr>
" close error window
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lv :echo g:neomake_javascript_enabled_makers<cr>
" switch buffers
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprev<cr>
nnoremap <silent> <leader>bb :b #<cr>
" splits shortcuts
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sb :split<cr>
nnoremap <leader>sc <c-w>c
nnoremap <leader>sq :qa<cr>
nnoremap <leader>ss :vertical resize 120<cr>
nnoremap <leader>se <c-w>=
nnoremap <leader>sf <c-w>\|
nnoremap <leader>sd :bp\|bd #<cr>
" site-wide search and replace
nnoremap <leader>sr :Gsearch<cr>
" switch filetype
nnoremap <leader>ftt :set ft?<cr>
nnoremap <leader>ftj :set ft=javascript<cr>
nnoremap <leader>ftx :set ft=jsx<cr>
nnoremap <leader>fts :set ft=typescript<cr>
nnoremap <leader>fth :set ft=html<cr>
nnoremap <leader>ftc :set ft=css<cr>
nnoremap <leader>ftv :set ft=vue<cr>
" center screen when doing n, N, { and }
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
" add semicolon at end of line
nnoremap <c-c> m`A;<esc>``
inoremap <c-c> <esc>m`A;<esc>``
" <c-d> to repeat last command
nmap <c-d> .
" insert empty line between brackets on <enter>
" inoremap {<cr> {<cr>}<c-o>O
" inoremap [<cr> [<cr>]<c-o>O
" inoremap (<cr> (<cr>)<c-o>O

" kk mapping for hard to reach keyboard keys
inoremap kkp ()<esc>i
inoremap kkc {}<esc>i
inoremap kks []<esc>i
inoremap kka <><esc>i
inoremap kkq ''<esc>i
inoremap kkw ""<esc>i
inoremap kkd <cr><esc>O
inoremap kkh <esc>i
inoremap kkl <esc>la
inoremap kkn <esc>A;
inoremap kkm <esc>A:
inoremap kk, <esc>A,
" note: have side effect for word booKKEeping, see word abbrev
inoremap kku _
inoremap kko ;
inoremap kke =
inoremap kkA <esc>A
" join 2 lines on insert mode when cursor is on second line
inoremap kkj <esc>kJxi
" select last entered word
inoremap kkv <esc>viw


" ----------------------------- Macros ------------------------------ "

" surround word with a single space inside a bracket
" this macro depends on easyclip and autopairs plugins
let @s="miwi p"


" ----------------------- Bugfix / Workaround ----------------------- "

" CtrlP not finding files in some projects/directories
" TODO: uncomment if its not working
" set shell=/bin/bash

" Rainbow doesn't work well with JavaScript
" TODO: uncomment if its not working
" augroup GroupJSFuncBlock
"   autocmd!
"   autocmd FileType javascript syntax clear jsFuncBlock
" augroup END


" ------------------------------ Notes ------------------------------ "

" vim tips
" http://zzapper.co.uk/vimtips.html

" :%s/\r//g                   : Delete DOS returns ^M
" Is your Text File jumbled onto one line? use following
" :%s/\r/\r/g                 : Turn DOS returns ^M into real returns

" find and replace
" http://jezenthomas.com/how-i-find-and-replace-in-vim/

" :args `ack -l '\bClass\b' --ignore-dir=compiled`
" :argdo %s/\<Class\>/MooTools.Class/gc | update

" profiling vim performance
" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!

" sample code how to use repeatable mapping
" nnoremap <silent> <Plug>TransposeLines ddp
" \:call repeat#set("\<Plug>TransposeLines")<cr>
" nmap cp <Plug>TransposeLines

" To do a rectangle selection of text from (1,1) to (2,2) in tmux:
" Go to the copy mode: C-a [
" Move the middle of a line
" Press C-v
" Press Space
" Move the selection with jkhl
" Once you are happy with your selection press Enter (or y if you have the binding in your conf file).
" You can paste the latest copy buffer by: C-a ]
" Notice that pressing space is necessary for rectangle selection.
" To select lines like you would normally do, go the copy mode, and press v, select with jkhl keys and press y.

" CTRLP - to rescan files, press F5 while in ctrl-p mode

" ------------------------------- END ------------------------------- "
