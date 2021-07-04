" *********************************************************************
" Description: My Neovim Configuration
" Version: 6th Gen
" Author: Felipe Apostol <flipjs.io@gmail.com>
" *********************************************************************

"-- Plugins --------------------------------------------------------- "

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'cocopon/iceberg.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'mbbill/undotree'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim' " telescope dependency
  Plug 'nvim-lua/popup.nvim' " telescope dependency
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vimwiki/vimwiki'
call plug#end()

lua require('options')

" -- Map Leader ----------------------------------------------------- "

" mapleader is space
let mapleader = "\<space>"

" -- Abbreviations -------------------------------------------------- "

" Note: some abbreviations are defined inside ftplugin directory
cnoreabbrev Q q
cnoreabbrev QQ cq!
cnoreabbrev q1 cq!
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

" -- Vim Configuration ---------------------------------------------- "

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

set guifont=FuraCode\ Nerd\ Font:h16
set encoding=utf8

" no error bell, no visual bell
set noeb vb t_vb=

" may be overridden in .editorconfig
set tabstop=2
set shiftwidth=2
set softtabstop=2
" tabbing is space
set expandtab

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
" add top and bottom padding (3 lines) when scrolling
set scrolloff=4

set splitbelow
set splitright

set mouse=a
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

set undodir=~/.local/share/nvim/undohistory
set undofile
set history=1000
set undolevels=1000

" ignore node_modules when expanding wildcards
set wildignore+=node_modules/**

" -- Plugin Configuration ------------------------------------------- "

""" lukas-reineke/indent-blankline.nvim
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" disable on start, just toggle when needed
let g:indent_blankline_enabled = v:false

""" christoomey/vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1

""" vimwiki/vimwiki
" set path to apple icloud location so ios app (iaWriter) can access it
let g:vimwiki_list = [{
      \ 'path': '$HOME/Library/Mobile Documents/27N4MQEA55~pro~writer/Documents',
      \ 'syntax': 'markdown'
      \ }]
" set extension to .md
let g:vimwiki_ext = '.md'
" make sure vimwiki doesn't own all .md files
let g:vimwiki_global_ext = 0

""" tpope/vim-fugitive
" auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" -- Plugin Mappings ------------------------------------------------ "

""" nvim-telescope/telescope.nvim
nnoremap <leader>ff :Telescope find_files theme=get_dropdown<cr>
nnoremap <leader>bb :Telescope buffers theme=get_dropdown<cr>
command! FF Telescope find_files theme=get_dropdown
command! BB Telescope buffers theme=get_dropdown
command! FG Telescope live_grep theme=get_dropdown

""" lukas-reineke/indent-blankline.nvim
command! IND IndentBlanklineToggle!

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

" -- General Mappings ------------------------------------------------"

" edit and source init.vim
nnoremap <leader>ve :edit $MYNVIMRC<cr>
nnoremap <leader>vs :source $MYNVIMRC<cr>
" use very magic on search and/or replace
nnoremap / /\v
cnoremap %s/ %s/\v
" hotkey for search and replace using very magic
nnoremap <leader>sr :%s/\v
" hotkey for tpope's abolish search
nnoremap <leader>SR :%S/
" ctrl-s to save
nnoremap <c-s> :update<cr><esc>
vnoremap <c-s> <esc>:update<cr><esc>
inoremap <c-s> <esc>:update<cr><esc>
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
" allow saving of files that need root permission
cmap w!! w !sudo tee > /dev/null %
