" *********************************************************************
" Description: My Neovim Configuration
" Version: 5th Gen
" Author: Felipe Apostol <flipjs.io@gmail.com>
" *********************************************************************

" NOTE ON MAPPING: Key mappings that can't be used:
" <c-a> = being used by Tmux

filetype off

"------------- Vim-Plug Configuration - must be on top ------------- "

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'cocopon/iceberg.vim'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'jreybert/vimagit'
  Plug 'junegunn/gv.vim'
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
  Plug 'jiangmiao/auto-pairs'
  Plug 'rking/ag.vim'
  Plug 'mileszs/ack.vim'
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
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'kana/vim-niceblock'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-function'
  Plug 'thinca/vim-textobj-function-javascript'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-line'
  Plug 'beloglazov/vim-textobj-quotes'
  Plug 'junegunn/vim-slash'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'keith/swift.vim'
  Plug 'wellle/targets.vim'
  Plug 'rhysd/clever-f.vim'
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'reasonml-editor/vim-reason-plus'
  Plug 'tomlion/vim-solidity'
  Plug 'flipjs/vim-hackernews'
  Plug 'DougBeney/vim-reddit'
  Plug 'benmills/vimux'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'machakann/vim-highlightedyank'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'qpkorr/vim-bufkill'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'mhinz/vim-grepper'
call plug#end()

syntax on
filetype plugin indent on

" --------------------------- Map Leader ---------------------------- "

" mapleader is space
let mapleader = "\<space>"

" ---------------------- Custom Configuration ----------------------- "

" set vim to use 256 colors
set t_Co=256

" support for 24-bit/true color
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" Enable substitution previews with inccommand
if has("nvim")
  set inccommand=nosplit
endif

" Neovim terminal configuration
if has("nvim")
  " esc to exit insert mode
  tnoremap <Esc> <C-\><C-n>
  " make split navigation mapping consistent across different modes
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  " paste into terminal when on insert mode
  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

syntax enable
set background=dark
colorscheme iceberg
set guifont=FuraCode\ Nerd\ Font:h16

" no error bell, no visual bell
set noeb vb t_vb=
set encoding=utf8
set nomodeline

" may be overridden in .editorconfig
set tabstop=2
set shiftwidth=2
set softtabstop=2
" tabbing is space
set expandtab

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
set formatoptions=qrn1
set list lcs=trail:·,tab:▸·
" syntax coloring lines that are too long just slows down the world
set synmaxcol=120

set splitbelow
set splitright

set mouse=a
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

" intelligently find files with gf/c-] commands
set path=.,src
set suffixesadd=.js,.jsx
set includeexpr=LoadMainNodeModule(v:fname)

" ------------------------- Plugin Settings ------------------------- "

""" HighlightedYank
let g:highlightedyank_highlight_duration = 500

""" Nerdtree-git-plugin
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

""" Indent-Guides
let g:indent_guides_enable_on_vim_startup = 1

""" Clever-f
let g:clever_f_smart_case = 1

""" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }
let g:LanguageClient_autoStart = 1

""" Limelight
" number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
" color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

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

""" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

""" Ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
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
set updatetime=500

""" Neoformat
let g:neoformat_try_formatprg = 1
autocmd FileType javascript set formatprg=prettier\ --single-quote\ --trailing-comma=es5\ --print-width=120\ --stdin

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

""" Mustache-Handlebars
let g:mustache_abbreviations = 1

""" Easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipShareYanks = 1
" do not autoformat pasted text
let g:EasyClipAutoFormat = 0
" disable this feature, see settings at the top (search modern editors)
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0

""" Ack.vim
let g:ackprg = "ag --vimgrep"

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
nnoremap <silent> <c-g> :TmuxNavigatePrevious<cr>

""" Rainbow-parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['{', '}'], ['(', ')'], ['[', ']']]

" ------------------------- Custom Commands ------------------------- "

" Vim-gitgutter
command! GG GitGutter
command! GGA GitGutterAll
command! GGT GitGutterToggle
command! GGS GitGutterStageHunk
command! GGN GitGutterNextHunk
command! GGP GitGutterPrevHunk
command! GGPR GitGutterPreviewHunk

" Vim-indent-guides
command! VIG IndentGuidesToggle

" Vim-plug
command! PU PlugUpdate | PlugUpgrade
command! PI PlugInstall
command! PC PlugClean

" Vimux
command! VP VimuxPromptCommand
command! VL VimuxRunLastCommand
command! VI VimuxInspectRunner
command! VZ VimuxZoomRunner
command! VS VimuxInterruptRunner
command! VC VimuxCloseRunner

" ---------------------------- Functions ---------------------------- "

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

function! CloseAllBuffersButCurrent()
    let curr = bufnr("%")
    let last = bufnr("$")

    if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
    if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

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

augroup ReasonML
  autocmd!
  autocmd Filetype reason nnoremap <buffer> gd :call LanguageClient_textDocument_definition()<cr>
  autocmd Filetype reason nnoremap <buffer> <c-u> :call LanguageClient_textDocument_formatting()<cr>
  autocmd Filetype reason nnoremap <buffer> gh :call LanguageClient_textDocument_hover()<cr>
  autocmd FileType reason nnoremap <buffer> <leader>rr :!clear && node %:r.bs.js<cr>
  autocmd FileType reason command! -buffer RR call VimuxRunCommand("clear; node " . expand("%:p:r") . ".bs.js")
augroup END

augroup Elm
  autocmd!
  autocmd FileType elm nnoremap <buffer> <leader>rr :ElmMake<cr>
  autocmd FileType elm nnoremap <buffer> <leader>re :ElmErrorDetail<cr>
augroup END

augroup Swift
  autocmd!
  autocmd FileType swift nnoremap <buffer> <leader>rr :!clear && swift %<cr>
augroup END

augroup Sass
  autocmd!
  autocmd FileType scss nnoremap <buffer> <leader>rr :!clear && sass % -t expanded<cr>
  autocmd FileType scss nnoremap <buffer> K :Dash<cr>
augroup END

augroup Css
  autocmd!
  autocmd FileType css nnoremap <buffer> K :Dash<cr>
augroup END

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!clear && node %<cr>
  " for babel to properly work with es6 or es6 import syntax, ensure .babelrc is defined
  autocmd FileType javascript nnoremap <buffer> <leader>rb :!clear && babel-node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rt :!clear && ava %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rl :!clear && jshint %<cr>
  autocmd FileType javascript command! -buffer RR call VimuxRunCommand("clear; node " . expand("%:p"))
  autocmd FileType javascript command! -buffer NRT call VimuxRunCommand("npm run test")
  autocmd FileType javascript command! -buffer NRTU call VimuxRunCommand("npm run test::unit")
  autocmd FileType javascript command! -buffer NRTI call VimuxRunCommand("npm run test::integration")
  autocmd FileType javascript command! -buffer NRQA call VimuxRunCommand("npm run qa")
  autocmd FileType javascript command! -buffer NRQALP call VimuxRunCommand("npm run qa::lint::print")
  autocmd FileType javascript nnoremap <buffer> K :Dash<cr>
augroup END

augroup TypeScript
  autocmd!
  autocmd FileType typescript nnoremap <buffer> <leader>rr :!clear && tsc %<cr>
  autocmd FileType typescript inoremap <buffer> {<cr> {<cr>}<c-o>O<tab>
  autocmd FileType typescript inoremap <buffer> [<cr> [<cr>]<c-o>O<tab>
  autocmd FileType typescript inoremap <buffer> (<cr> (<cr>)<c-o>O<tab>
  autocmd FileType typescript nnoremap <buffer> K :Dash<cr>
augroup END

augroup CoffeeScript
  autocmd!
  autocmd FileType coffee nnoremap <buffer> <leader>rr :CoffeeRun<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rl :!clear && coffeelint %<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rc :CoffeeCompile vert<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rw :CoffeeWatch vert<cr>
  autocmd FileType coffee nnoremap <buffer> K :Dash<cr>
augroup END

augroup PHP
  autocmd!
  autocmd FileType php nnoremap <buffer> <leader>rr :!clear && php %<cr>
  autocmd FileType php nnoremap <buffer> K :Dash<cr>
augroup END

augroup Ruby
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <leader>rr :!clear && ruby %<cr>
  autocmd FileType ruby nnoremap <buffer> K :Dash<cr>
augroup END

augroup Python
  autocmd!
  autocmd FileType python nnoremap <buffer> <leader>rr :!clear && python3 %<cr>
  autocmd FileType python nnoremap <buffer> <leader>r2 :!clear && python2 %<cr>
  autocmd FileType python nnoremap <buffer> K :Dash<cr>
augroup END

augroup Elixir
  autocmd!
  autocmd FileType elixir nnoremap <buffer> <leader>rr :!clear && elixir %<cr>
  autocmd FileType elixir nnoremap <buffer> <leader>re :!clear && mix test<cr>
  autocmd FileType python nnoremap <buffer> K :Dash<cr>
augroup END

augroup Handlebars
  autocmd!
  autocmd BufNewFile,BufRead *.hbs set filetype=html.handlebars
  autocmd FileType html.handlebars nnoremap <buffer> K :Dash<cr>
augroup END

augroup RainbowParentheses
  autocmd!
  autocmd FileType javascript,javascript.jsx,scss RainbowParentheses
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

""" Grepper
nnoremap <leader>gg :Grepper -tool rg<cr>
nnoremap <leader>GG :Grepper -tool rg -buffers<cr>
nnoremap <leader>GT :Grepper -tool git<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
command! Todo :Grepper -noprompt -tool git -grepprg git grep -nIi '\(TODO\|FIXME\)'

""" Airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""" Textobj-quotes
xmap q iq
omap q iq

""" Limelight
command! LL Limelight!!

""" FZF
" linewise completion for the win!
imap <c-x><c-l> <plug>(fzf-complete-line)

""" Visual-star-search
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<cr>
vnoremap <leader>* :<c-u>call VisualStarSearchSet('/', 'raw')<cr>:call ag#Ag('grep', '--literal ' . shellescape(@/))<cr>

""" Easyclip
" easyclip shadows m, rebind m to gm
nnoremap gm m

""" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

""" Ranger
let g:ranger_map_keys = 0
nnoremap <leader>rg :Ranger<cr>

""" CtrlP
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>fm :CtrlPMixed<cr>

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

" delete all buffers but current
command! Only call CloseAllBuffersButCurrent()

" delete empty buffers
nnoremap <leader>de :call DeleteEmptyBuffers()<cr>

" -------------------------- Alt Mapping ---------------------------- "

nmap <a-q> :q<cr>
nmap <a-x> :cclose<cr>
nmap <a-m> :Ag! "\b<cword>\b"<cr>
" nmap <esc>k :Ag! "\b<cword>\b"<cr>

" ------------------------- Custom Mapping -------------------------- "

" tmux send-keys - run previous terminal command
nnoremap <leader>t1 :!tmux send-keys -t 1 C-p C-j<cr><cr>
nnoremap <leader>t2 :!tmux send-keys -t 2 C-p C-j<cr><cr>
nnoremap <leader>t3 :!tmux send-keys -t 3 C-p C-j<cr><cr>
nnoremap <leader>t4 :!tmux send-keys -t 4 C-p C-j<cr><cr>
nnoremap <leader>t5 :!tmux send-keys -t 5 C-p C-j<cr><cr>
" allow saving of files that need root permission
cmap w!! w !sudo tee > /dev/null %
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
nnoremap <leader>dd :BD<cr>
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
" switch buffers
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bv :bprev<cr>
nnoremap <silent> <leader>bb <c-^>
" splits shortcuts
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sb :split<cr>
nnoremap <leader>sc <c-w>c
nnoremap <leader>sq <c-w>q
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
noremap <plug>(slash-after) zz
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
nmap <c-d> .
" format code
nnoremap g= gg=G``
nnoremap gG mmgggqG`m
" make c/d/y action on the current line
nnoremap cl c$
nnoremap ch c^
nnoremap yl y$
nnoremap yh y^
nnoremap dl d$
nnoremap dh d^
" make { and } jump to first and last line of paragraph
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'
" use arrow keys to resize splits
nnoremap <a-up>    :resize +5<cr>
nnoremap <a-down>  :resize -5<cr>
nnoremap <a-left>  :vertical resize -5<CR>
nnoremap <a-right> :vertical resize +5<CR>

" ------------------------------ Notes ------------------------------ "

" New stuff to try
" <c-x><c-l>
" <c-x><c-f>
" q/
" q:
" -17,-11t.
" +18,+22t.

" When using without your .vimrc (e.g. using other PC), use this quick setup
" set nocompatible
" set ts=2 sw=2 sts=2 et
" set backspace=indent,eol,start

" ------------------------------- END ------------------------------- "
