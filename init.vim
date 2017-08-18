" *********************************************************************
" Description: My Neovim Configuration
" Version: 5th Gen
" Author: Felipe Apostol <flipjs.io@gmail.com>
" *********************************************************************

" NEW STUFF TO TRY:
" <c-x><c-l>
" <c-x><c-f>
" q/
" q:
" -17,-11t.
" +18,+22t.

" NOTE ON MAPPING: Key mappings that can't be used:
" <c-a> = being used by Tmux

filetype off

"------------- Vim-Plug Configuration - must be on top ------------- "

call plug#begin('~/.local/share/nvim/plugged')
  " Comment out vim-sensible here, may not be needed in neovim-0.2.0
  Plug 'altercation/vim-colors-solarized'
  Plug 'lifepillar/vim-solarized8'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'kien/ctrlp.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'
  Plug 'sbdchd/neoformat'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'mxw/vim-jsx'
  Plug 'scrooloose/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rking/ag.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sjl/gundo.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'elzr/vim-json'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tommcdo/vim-exchange'
  Plug 'svermeulen/vim-easyclip'
  Plug 'bronson/vim-visual-star-search'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'skwp/greplace.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'wakatime/vim-wakatime'
  Plug 'mattn/emmet-vim'
  Plug 'wavded/vim-stylus'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'vim-ruby/vim-ruby'
  Plug 'elixir-lang/vim-elixir'
  Plug 'elmcast/elm-vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'kana/vim-niceblock'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-function'
  Plug 'thinca/vim-textobj-function-javascript'
call plug#end()

syntax on
filetype plugin indent on

" --------------------------- Map Leader ---------------------------- "

" mapleader is space
let mapleader = " "

" ---------------------- Custom Configuration ----------------------- "

" Ensure vim-sensible is installed for set defaults

" set vim to use 256 colors
set t_Co=256

" From https://github.com/rakr/vim-one
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Enable substitution previews with inccommand
if has("nvim")
  set inccommand=nosplit
endif

" Neovim terminal configuration
if has("nvim")
  " make escape work in the Neovim terminal.
  tnoremap <Esc> <C-\><C-n>
  " make navigation into and out of Neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  " prefer Neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif

syntax enable
set background=dark
colorscheme solarized8_dark_high
" colorscheme solarized

" overwrite current theme's git diff colors
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse

" no error bell, no visual bell
set noeb vb t_vb=
set encoding=utf-8
set nomodeline

" may be overridden in .editorconfig
set tabstop=2
set shiftwidth=2
set softtabstop=2
" tabbing is space
set expandtab

set number
set relativenumber
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
" set nolist
" set listchars=tab:▸\ ,eol:¬
set list lcs=trail:·,tab:▸·
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=120

set splitbelow
set splitright

set mouse=a
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

" ------------------------- Plugin Settings ------------------------- "

""" NERDTree
let NERDTreeShowHidden=1

""" FZF
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap <leader>hc :CmdHist<CR>
" better search history with q/
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap <leader>hs :QHist<CR>
" use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

""" Gundo
set undodir=~/.config/nvim/undohistory
set undofile
set history=1000
set undolevels=1000
let g:gundo_width = 30

""" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\ ]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

""" SuperTab
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" TODO:
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" close the preview window when you're not using it
" let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
set completeopt-=preview

""" Vim-Airline
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" Ale
let g:ale_linters = {
  \ 'javascript': ['eslint'],
\ }
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? 'OK' : printf(
    \ '%dW %dE',
    \ all_non_errors,
    \ all_errors
  \ )
endfunction
set statusline=%{LinterStatus()}

""" Git-Gutter
" if Gdiff shows an error, try increasing the time or just disable it
set updatetime=500

""" Neoformat
let g:neoformat_try_formatprg = 1
autocmd FileType javascript set formatprg=prettier\ --single-quote\ --stdin


""" JSX
let g:jsx_ext_required = 0

""" Elm
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0
let g:elm_classic_highlighting = 1
let g:elm_make_show_warnings = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_format_fail_silently = 0

""" Greplace
set grepprg=git\ grep
let g:grep_cmd_opts = '--line-number'
" Ag here doesn't respect .agignore
" Commented out and use config above (git\ grep)
" set grepprg=ag
" let g:grep_cmd_opts = '--line-numbers --noheading'

""" Mustache-Handlebars
let g:mustache_abbreviations = 1

""" Easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipShareYanks = 1
" do not autoformat pasted text
let g:EasyClipAutoFormat = 0
" disable this feature, see settings at the top (search modern editors)
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0

""" Ag.vim
set runtimepath^=~/.local/share/nvim/plugged/ag

""" CtrlP
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
let g:ctrlp_match_window_reversed = 0
" search by filename - can be toggled on/off by pressing <c-d> inside the prompt
let g:ctrlp_by_filename = 1

""" Tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <c-g> :TmuxNavigatePrevious<cr>

""" Rainbow Parentheses
let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
\ ]
au FileType javascript,javascript.jsx,scss,clojure RainbowParenthesesLoadRound
au FileType javascript,javascript.jsx,scss,clojure RainbowParenthesesLoadBraces
au FileType javascript,javascript.jsx,scss,clojure RainbowParenthesesLoadSquare
au FileType javascript,javascript.jsx,scss,clojure RainbowParenthesesActivate

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

augroup Elm
  autocmd!
  autocmd FileType elm nnoremap <buffer> <leader>rr :ElmMake<cr>
  autocmd FileType elm nnoremap <buffer> <leader>re :ElmErrorDetail<cr>
augroup END

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!clear && node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rb :!clear && babel-node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rt :!clear && ava %<cr>
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

""" FZF
" linewise completion for the win!
imap <c-x><c-l> <plug>(fzf-complete-line)

""" Visual-star-search
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<cr>
vnoremap <leader>* :<c-u>call VisualStarSearchSet('/', 'raw')<cr>:call ag#Ag('grep', '--literal ' . shellescape(@/))<cr>

""" Easyclip
" easyclip shadows m, rebind m to gm
nnoremap gm m
" <cmd-v> seems to be ok in neovim, disable <c-v> mapping below
" imap <c-v> <plug>EasyClipInsertModePaste
" cmap <c-v> <plug>EasyClipCommandModePaste

""" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

""" CtrlP
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>fc :Commits<cr>

""" Gundo
nnoremap <leader>uu :GundoToggle<cr>
nnoremap <leader>ue :earlier 1f<cr>
nnoremap <leader>ul :later 1f<cr>

""" Neoformat
nnoremap <c-u> :Neoformat<cr>

""" Emmet
imap <c-e> <c-y>,

""" Vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ------------------------ Function Mapping ------------------------- "

" file header
command! FileHeader call FileHeader()
" line header
command! -nargs=1 LineHeader call LineHeader(67, <f-args>)

" delete empty buffers
nnoremap <leader>de :call DeleteEmptyBuffers()<cr>

" ------------------------- Custom Mapping -------------------------- "

" open current file's directory in Finder
command! Finder silent exe '!open ' . expand("%:p:h")
" edit and source init.vim
nnoremap <leader>ve :edit $MYNVIMRC<cr>
nnoremap <leader>vs :source $MYNVIMRC<cr>
nnoremap <leader>vu :source $HOME/.config/nvim/unmap.vim<cr>
nnoremap <leader>vj :edit $HOME/.config/nvim/UltiSnips/javascript/javascript.snippets<cr>
nnoremap <leader>vr :edit $HOME/.config/nvim/UltiSnips/javascript/javascript-react.snippets<cr>
nnoremap <leader>vn :edit $HOME/.config/nvim/UltiSnips/javascript/javascript-node.snippets<cr>
nnoremap <leader>vp :edit $HOME/.config/nvim/UltiSnips/php.snippets<cr>
" ctrl-s to save
nnoremap <c-s> :update<cr><esc>
vnoremap <c-s> <esc>:update<cr><esc>
inoremap <c-s> <esc>:update<cr><esc>
" ctrl-q to safely quit session
noremap <c-q><c-q> :confirm qall<CR>
" close current buffer
nnoremap <leader>dd :bd<cr>
" save current buffer
nnoremap <leader>ww :w<cr>
" save current buffer and syntax-check at the same time
" nnoremap <leader>ws :w <bar> call SyntaxCheck()<cr>
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
" show error window - syntastic
" nnoremap <leader>lo :Errors<cr>
" close error window
nnoremap <leader>lc :lclose<cr>
" run syntax checker
" nnoremap <leader>ls :call SyntaxCheck()<cr>
" toggle gutter display
" nnoremap <leader>lt :SyntasticToggleMode<cr>
" show current syntax checker
" nnoremap <leader>lv :echo b:syntastic_checkers<cr>
" switch buffers
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprev<cr>
nnoremap <silent> <leader>bb <c-^>
" splits shortcuts
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sb :split<cr>
nnoremap <leader>sc <c-w>c
nnoremap <leader>sq :qa<cr>
nnoremap <leader>ss :vertical resize 121<cr>
nnoremap <leader>se <c-w>=
nnoremap <leader>sf <c-w>\|<c-w>_
nnoremap <leader>sd :bp\|bd #<cr>
" site-wide search and replace
nnoremap <leader>sr :Gsearch<cr>
" switch filetype
nnoremap <leader>ftt :set ft?<cr>
nnoremap <leader>ftj :set ft=javascript<cr>
nnoremap <leader>ftx :set ft=javascript.jsx<cr>
nnoremap <leader>fts :set ft=typescript<cr>
nnoremap <leader>fth :set ft=html<cr>
nnoremap <leader>ftc :set ft=css<cr>
nnoremap <leader>ftv :set ft=vue<cr>
" jsdoc
nnoremap <leader>jsd :JsDoc<cr>
nnoremap <leader>jst :TernDoc<cr>
" center screen when doing n, N, { and }
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
" enclose line in reactjs-style comment tag
nnoremap <leader>cc ^i{/* <esc>A */}<esc>
" remove reactjs-style comment tag
nnoremap <leader>cd ^4x$3Xx
" ctrl-c to insert semicolon at eol
nnoremap <c-c> m`A;<esc>``
inoremap <c-c> <esc>m`A;<esc>``
" <c-d> to repeat last command
nnoremap <c-d> .

" ----------------------- Bugfix / Workaround ----------------------- "

" CtrlP not finding files in some projects/directories
" set shell=/bin/bash

" Rainbow doesn't work well with JavaScript
" augroup GroupJSFuncBlock
"   autocmd!
"   autocmd FileType javascript syntax clear jsFuncBlock
" augroup END


" ----------------------------- Macros ------------------------------ "

" surround word with a single space inside a bracket
" this macro depends on easyclip and autopairs plugins
let @s="miwi p"


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

" When using without your .vimrc (e.g. using other PC), use this quick setup
" set nocompatible
" set ts=2 sw=2 sts=2 et
" set backspace=indent,eol,start

" ------------------------------- END ------------------------------- "

