" *********************************************************************
" Description: My Neovim Configuration
" Version: 5th Gen
" Author: Felipe Apostol <flipjs.io@gmail.com>
" *********************************************************************

" NOTE ON MAPPING: Key mappings that can't be used:
" <c-a> = being used by Tmux

"------------- Vim-Plug Configuration - must be on top ------------- "

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'cocopon/iceberg.vim'
  Plug 'gkeep/iceberg-dark'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  " vim-repeat is at least required by vim-easyclip
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'flipjs/vim-ragtag'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'jreybert/vimagit'
  Plug 'junegunn/gv.vim'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'tpope/vim-rhubarb'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'dense-analysis/ale'
  Plug 'sbdchd/neoformat'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'moll/vim-node'
  Plug 'jiangmiao/auto-pairs'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'elzr/vim-json'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tommcdo/vim-exchange'
  " vim-easyclip requires tpope/repeat plugin
  Plug 'svermeulen/vim-easyclip'
  Plug 'tomtom/tcomment_vim'
  Plug 'wakatime/vim-wakatime'
  Plug 'wavded/vim-stylus'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'ap/vim-css-color'
  Plug 'kchmck/vim-coffee-script'
  Plug 'vim-ruby/vim-ruby'
  Plug 'elixir-lang/vim-elixir'
  Plug 'elmcast/elm-vim'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'tomlion/vim-solidity'
  Plug 'keith/swift.vim'
  Plug 'othree/html5.vim'
  Plug 'rodjek/vim-puppet'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'rust-lang/rust.vim'
  Plug 'jparise/vim-graphql'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " typescript tooling
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'Quramy/tsuquyomi'
  " tsuquyomi requires vimproc
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'kana/vim-niceblock'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-function'
  Plug 'thinca/vim-textobj-function-javascript'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-line'
  Plug 'reedes/vim-textobj-quote'
  Plug 'christoomey/vim-sort-motion'
  Plug 'junegunn/vim-slash'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'wellle/targets.vim'
  Plug 'rhysd/clever-f.vim'
  Plug 'flipjs/vim-hackernews'
  Plug 'benmills/vimux'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " TODO: change tiagofumo to johnstef99 for now to resolve annoying error message
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'johnstef99/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'machakann/vim-highlightedyank'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'qpkorr/vim-bufkill'
  " francoiscabrol/ranger.vim requires bclose.vim to work under neovim
  Plug 'francoiscabrol/ranger.vim'
  " bclose.vim is required by francoiscabrol/ranger.vim for neovim
  Plug 'rbgrouleff/bclose.vim'
  Plug 'mhinz/vim-grepper'
  Plug 'jremmen/vim-ripgrep'
  Plug 'vim-scripts/LogiPat'
  Plug 'vim-scripts/marvim'
  Plug 'airblade/vim-rooter'
  Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex', 'VimwikiDiaryIndex'] }
  Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
  Plug 'vim-test/vim-test'
  Plug 'DougBeney/pickachu'
  Plug 'tweekmonster/startuptime.vim'
  Plug 'mattn/emmet-vim'
call plug#end()

" --------------------------- Map Leader ---------------------------- "

" mapleader is space
let mapleader = "\<space>"

" -------------------------- QMK/ZMK Fix ---------------------------- "

" FIX: This is a special case with my custom split keyboard where CTRL and C
" are mapped to the same key. Sometimes, when pressing C and A in succession
" causing QMK/ZMK to send it as "CTRL-A". To resolve this temporarily, if Vim
" receives CTRL-A in insert mode, force it to type "ca" instead.
inoremap <c-a> ca

" ---------------------- Custom Configuration ----------------------- "

" set vim to use 256 colors
set t_Co=256

" support for 24-bit/true color
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
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

set background=dark
colorscheme iceberg
" override search higlight from iceberg colorscheme
hi! Search ctermbg=235 ctermfg=yellow guibg=#1e2132 guifg=yellow gui=underline

" set guifont=FuraCode\ Nerd\ Font:h15

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

" stop search when hit bottom or top of file
set nowrapscan

set ignorecase
set smartcase
set infercase
set gdefault

set wrap
set linebreak
set breakindent
set showbreak=»\
set formatoptions=qrn1
set list lcs=trail:·,tab:▸·
" syntax coloring lines that are too long just slows down the world
" TODO: uncomment line below when performance degrades
" set synmaxcol=120
" add top and bottom padding (3 lines) when scrolling
set scrolloff=3

set splitbelow
set splitright

set mouse=a
" TODO: vim got slow due to this for some reasosn
set clipboard=unnamed

" clipboard settings below made vim startup a lot faster!
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

set nobackup
set nowritebackup
set noswapfile
set updatetime=250

set wildmenu
set wildmode=full
" ignore node_modules when expanding wildcards
set wildignore+=node_modules/**

" intelligently find files with gf/c-] commands
set path=.,src
set suffixesadd=.js,.jsx
set includeexpr=LoadMainNodeModule(v:fname)

" Vim Wiki requires below - but no need to set in neovim
" set nocompatible " ignored in nvim
" filetype plugin indent on " enabled by default in nvim
" syntax on " see syntax enable

if !exists("g:syntax_on")
    syntax enable
endif

" ------------------------- Plugin Settings ------------------------- "

""" vim-test/vim-test
let g:test#javascript#runner = 'jest'

""" suan/vim-instant-markdown
let g:instant_markdown_autostart = 0

""" vimwiki/vimwiki
" set path to either icloud or static git repo (personal m1 laptop vs work laptop)
let g:vimwiki_list = [{
      \ 'path': system('arch') == "arm64" ? '$ICLOUD_WIKI' : '$GOGO_WIKI',
      \ 'syntax': 'markdown'
      \ }]
" set extension to .md
let g:vimwiki_ext = '.md'
" make sure vimwiki doesn't own all .md files
let g:vimwiki_global_ext = 0
" turn off link shortening
let g:vimwiki_url_maxsave=0

""" tpope/vim-fugitive
" see augroup Fugitive

""" airblade/vim-gitgutter
" default is HEAD already - its just here so it can be changed freely when needed
let g:gitgutter_diff_base = 'HEAD'

""" shumphrey/fugitive-gitlab.vim
let g:fugitive_gitlab_domains = ['https://git.ca.intelsat.com']

""" ludovicchabant/vim-gutentags
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitrebase']
let g:gutentags_ctags_exclude = ['node_modules', 'public', 'tmp']

""" airblade/vim-rooter
let g:rooter_patterns = ['.git/']

""" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""" Quramy/tsuquyomi
" - see augroup TypeScript

""" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 300

""" Xuyuanp/nerdtree-git-plugin
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

""" scrooloose/nerdtree
let NERDTreeShowHidden=1
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
" change default mapping 'm' to 'M'
let g:NERDTreeMapMenu = 'M'

""" francoiscabrol/ranger.vim
let g:ranger_map_keys = 0

""" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 0

""" rhysd/clever-f.vim
let g:clever_f_smart_case = 1

""" junegunn/fzf
let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '~40%' }
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap <leader>hc :CmdHist<CR>
" better search history with q/
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap <leader>hs :QHist<CR>
" use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

""" simnalamburt/vim-mundo
set undodir=~/.config/nvim/undohistory-0.5
set undofile
set history=1000
set undolevels=1000

""" Shougo/deoplete.nvim
let g:python3_host_prog = system('arch') == "arm64" ? "/opt/homebrew/bin/python3" : "/usr/local/bin/python3"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
  \ 'javascript': '[^. *\t]\.\w*',
\ })
call deoplete#custom#var('omni', 'functions', {
  \ 'javascript': ['javascriptcomplete#CompleteJS']
\})
call deoplete#custom#source('omni', 'functions', {
  \ 'javascript': ['tern#Complete', 'jspc#omni']
\})
set completeopt=longest,menuone,preview
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

""" ervandew/supertab
" see augroup JavaScript for autocmd settings
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

""" vim-airline/vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline_powerline_fonts = 1
" FIXME: unable to work Powerline Fonts on Windows Subsystem for Linux
" in Thinkpad X220. Temporary solution is to disable if not macOS.
if has("unix")
  let s:uname = system("uname -s")
  if s:uname != "Darwin\n"
    let g:airline_powerline_fonts = 0
  endif
endif

""" gkeep/iceberg-dark
let g:airline_theme='icebergDark'

""" dense-analysis/ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'haskell': ['brittany'],
\}
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'json': ['jsonlint'],
\ }

""" sbdchd/neoformat
let g:neoformat_try_formatprg = 1

""" maxmellon/vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

""" elmcast/elm-vim
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0
let g:elm_classic_highlighting = 1
let g:elm_make_show_warnings = 1
let g:elm_format_fail_silently = 0

""" mustache/vim-mustache-handlebars
let g:mustache_abbreviations = 1

""" svermeulen/vim-easyclip
let g:EasyClipUseSubstituteDefaults = 1
" disable since yank is shared in clipboard anyway
let g:EasyClipShareYanks = 0
" do not autoformat pasted text
let g:EasyClipAutoFormat = 0
" disable this feature, see settings at the top (search modern editors)
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0

""" kien/ctrlp.vim
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
let g:ctrlp_match_window_reversed = 0
" search by filename - can be toggled on/off by pressing <c-d> inside the prompt
let g:ctrlp_by_filename = 1

""" christoomey/vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1

""" junegunn/rainbow_parentheses.vim
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['{', '}'], ['(', ')'], ['[', ']']]

" ------------------------- Custom Commands ------------------------- "

""" Terminal Notifier
command! NTF !pkill -f entr; fd . './' -E node_modules | entr -d terminal-notifier -message "Files updated" &

""" Insert Dates
command! YYMMDD put=strftime('%Y-%m-%d')
command! DATE put=strftime('%b %d, %Y')

""" suan/vim-instant-markdown
command! MDP InstantMarkdownPreview

""" airblade/vim-gitgutter
command! GG GitGutter
command! GGA GitGutterAll
command! GGT GitGutterToggle
command! GGS GitGutterStageHunk
command! GGN GitGutterNextHunk
command! GGP GitGutterPrevHunk
command! GGPR GitGutterPreviewHunk

"""sbdchd/neoformat
command! FORM Neoformat

" Suspend vim
command! SS sus

" junegunn/limelight.vim
command! LL Limelight
command! LLL Limelight!

""" tpope/vim-fugitive
command! GST Gstatus
command! GC Gcommit
command! GP Gpush

""" nathanaelkane/vim-indent-guides
command! VIG IndentGuidesToggle
command! IND IndentGuidesToggle

" junegunn/vim-plug
command! PU PlugUpdate | PlugUpgrade
command! PI PlugInstall
command! PC PlugClean

" benmills/vimux
command! VP VimuxPromptCommand
command! VL VimuxRunLastCommand
command! VI VimuxInspectRunner
command! VZ VimuxZoomRunner
command! VS VimuxInterruptRunner
command! VC VimuxCloseRunner

""" dense-analysis/ale
command! ALE call ale#cursor#ShowCursorDetail()
command! AF ALEFirst
command! AN ALENext
command! AP ALEPrevious

" ---------------------------- Functions ---------------------------- "

function! ToggleNeoFormatOnSave()
  if !exists('#NeoFormatOnSave#BufEnter')
    augroup NeoFormatOnSave
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
    augroup END
  else
    augroup NeoFormatOnSave
      autocmd!
    augroup END
  endif
endfunction

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

let s:toggle_status = 0
function! ToggleStatus()
    if s:toggle_status  == 0
        let s:toggle_status = 1
        set laststatus=0
    else
        let s:toggle_status = 0
        set laststatus=2
    endif
  endfunction

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

augroup Haskell
  autocmd!
  autocmd FileType haskell command! -buffer FIX ALEFix
  autocmd FileType haskell nnoremap <buffer> K :Dash<cr>
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
  autocmd FileType javascript command! -buffer FIX ALEFix
  autocmd FileType javascript nnoremap <buffer> ]l :ALENext<cr>
  autocmd FileType javascript nnoremap <buffer> [l :ALEPrevious<cr>
  autocmd FileType javascript command! -buffer RR call VimuxRunCommand("clear; node " . expand("%:p"))
  autocmd FileType javascript command! -buffer NRB call VimuxRunCommand("npm run build")
  autocmd FileType javascript command! -buffer NRT call VimuxRunCommand("npm run test")
  autocmd FileType javascript command! -buffer NRTU call VimuxRunCommand("npm run test::unit")
  autocmd FileType javascript command! -buffer NRTI call VimuxRunCommand("npm run test::integration")
  autocmd FileType javascript command! -buffer NRQA call VimuxRunCommand("npm run qa")
  autocmd FileType javascript command! -buffer NRQALP call VimuxRunCommand("npm run qa::lint::print")
  autocmd FileType javascript nnoremap <buffer> K :Dash<cr>
  """ ervandew/supertab
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
augroup END

augroup TypeScript
  autocmd!
  autocmd FileType typescript nnoremap <buffer> <leader>rr :!clear && ts-node %<cr>
  autocmd FileType typescript nnoremap <buffer> K :Dash<cr>
  autocmd FileType typescript nmap <buffer> T : <C-u>echo tsuquyomi#hint()<cr>
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
  autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx,rust,haskell,scss RainbowParentheses
augroup END

augroup Fugitive
  autocmd!
  " auto-clean fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" This seems to cause issues in my work's MBP laptop - commenting out for now
" augroup KillEntrOnVimExit
"   autocmd!
"   autocmd VimLeave * :!pkill -f entr
" augroup END

augroup FileChangedOnDisk
  autocmd!
  " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
  " Triger `autoread` when files changes on disk
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  " Notification after file change
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

" -------------------------- Abbreviations -------------------------- "

" Note: some abbreviations are defined inside ftplugin directory
cnoreabbrev Q q
cnoreabbrev QQ cq!
cnoreabbrev qui cq!
cnoreabbrev q1 cq!
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qw wq
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

""" vimwiki/vimwiki
nnoremap <leader>ww :VimwikiIndex<cr>
nnoremap <leader>wi :VimwikiDiaryIndex<cr>

""" vim-test/vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

""" junegunn/vim-slash
noremap <plug>(slash-after) zz

""" tpope/vim-fugitive
nmap <expr> <leader>gb &filetype ==# 'fugitiveblame' ? "gq" : ":Git blame\r"

""" mhinz/vim-grepper
nnoremap <leader>gg :Grepper -tool rg<cr>
nnoremap <leader>GG :Grepper -tool rg -buffers<cr>
nnoremap <leader>GT :Grepper -tool git<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
command! Todo :Grepper -noprompt -tool git -grepprg git grep -nIi '\(TODO\|FIXME\)'

""" vim-airline/vim-airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""" svermeulen/vim-easyclip
" easyclip shadows m, rebind m to gm
nnoremap gm m

""" scrooloose/nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

""" francoiscabrol/ranger.vim
nnoremap <leader>rg :Ranger<cr>

""" junegunn/fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>fs :GFiles?<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fc :Commits<cr>
" linewise completion for the win!
imap <c-x><c-l> <plug>(fzf-complete-line)

""" kien/ctrlp.vim
nnoremap <leader>fm :CtrlPMixed<cr>

""" simnalamburt/vim-mundo
nnoremap <leader>uu :MundoToggle<cr>
nnoremap <leader>ue :earlier 1f<cr>
nnoremap <leader>ul :later 1f<cr>

""" sbdchd/neoformat
nnoremap <f4> :call ToggleNeoFormatOnSave()<cr>

""" christoomey/vim-tmux-navigator
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-g> :TmuxNavigatePrevious<cr>
nnoremap <silent> <leader><leader>h :TmuxNavigateLeft<cr> :vertical resize 121<cr>
nnoremap <silent> <leader><leader>j :TmuxNavigateDown<cr> :vertical resize 121<cr> <c-w>_
nnoremap <silent> <leader><leader>k :TmuxNavigateUp<cr> :vertical resize 121<cr> <c-w>_
nnoremap <silent> <leader><leader>l :TmuxNavigateRight<cr> :vertical resize 121<cr>

" ------------------------ Function Mapping ------------------------- "

" aid for search and replace in quickfix
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()

" rename file
map <leader>rn :call RenameFile()<cr>

" toggle status
nnoremap <silent> cos :call ToggleStatus()<cr>

" file header
command! FileHeader call FileHeader()

" line header
command! -nargs=1 LineHeader call LineHeader(67, <f-args>)

" delete all buffers but current
command! Only call CloseAllBuffersButCurrent()

" delete empty buffers
nnoremap <leader>de :call DeleteEmptyBuffers()<cr>

" ------------------------- Custom Mapping -------------------------- "

cnoremap <expr> %% expand('%:h').'/'

" tags - follow definition of current word (for gergoplex keyboard)
nnoremap <c-t> <c-]>

" use very magic on search and/or replace
nnoremap / /\v
cnoremap %s/ %s/\v
" hotkey for search and replace using very magic
nnoremap <leader>sr :%s/\v
" hotkey for tpope's abolish search
nnoremap <leader>SR :%S/

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
" close saved buffer(s)
nnoremap <leader>qq :q<cr>
" apply macros with Q
nnoremap Q @q
xnoremap Q :'<,'>:normal @q<cr>
" remap ^ $
nnoremap H ^
nnoremap L $
vnoremap L g_
" a better version of mapping j/k to gj/gk
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" type jj to get out of insert mode
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
nnoremap <leader>sa <c-w>r
nnoremap <leader>so <c-w>o
nnoremap <leader>ss :vertical resize 121<cr>
nnoremap <leader>se <c-w>=
nnoremap <leader>sh <c-w>_
nnoremap <leader>sw <c-w>\|
nnoremap <leader>sf <c-w>\|<c-w>_
nnoremap <leader>sd :bp\|bd #<cr>
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
" center screen when doing { and }
nnoremap { {zz
nnoremap } }zz
" enclose line in reactjs-style comment tag
nnoremap <leader>cc ^i{/* <esc>A */}<esc>
" remove reactjs-style comment tag
nnoremap <leader>cd ^4x$3Xx
" ctrl-c to insert semicolon at end of line
nnoremap <c-c> m`A;<esc>``
inoremap <c-c> <esc>m`A;<esc>``
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
" use arrow keys to resize splits
nnoremap <a-up>    :resize +5<cr>
nnoremap <a-down>  :resize -5<cr>
nnoremap <a-left>  :vertical resize -5<CR>
nnoremap <a-right> :vertical resize +5<CR>
"make dot work over visual line selections
xnoremap . :norm.<CR>
xnoremap <c-d> :norm.<CR>
" show current file path
nnoremap <leader>ep :echo @%<cr>
" show current branch - TODO: find a better implementation
nnoremap <leader>eb :!git branch<cr>
" macro to git branch -D a list of branch names
command! GBD :norm Igit branch -D <esc>j0

" elegant way to do these mappings?
nnoremap yir yi]
nnoremap cir ci]
nnoremap dir di]
nnoremap vir vi]
nnoremap yar ya]
nnoremap car ca]
nnoremap dar da]
nnoremap var va]

" ------------------------------ Notes ------------------------------ "

" New stuff to try
" <c-x><c-l>
" <c-x><c-f>
" q/
" q:
" -17,-11t.
" +18,+22t.
"
" Creating a repeatable mapping
" nnoremap <silent> <Plug>TransposeCharacters xp
"   \:call repeat#set("\<Plug>TransposeCharacters")<CR>
" nmap cp <Plug>TransposeCharacters

" When using without your .vimrc (e.g. using other PC), use this quick setup
" set nocompatible
" set ts=2 sw=2 sts=2 et
" set backspace=indent,eol,start
"
" extra settings below - only if you can remember it
" syntax on
" filetype plugin indent on
" set number
" set hidden
" set expandtab

" ------------------------------- END ------------------------------- "
