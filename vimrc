" Base config from: https://missing.csail.mit.edu/2020/editors/

" Ignore vi, we are vim
set nocompatible

" ==================================
"               Colors
" ==================================
" Turn on syntax highlighting.
syntax on
" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Make cursor distinct in insert mode
let &t_SI = "\e[6 q" " Ps = 6  -> steady bar (xterm).
let &t_EI = "\e[2 q" " Ps = 2  -> steady block.

" ==================================
"               Features
" ==================================
" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers.
set number
" I don't really like relative number
" set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
" If we include caps no longer ignore case
set smartcase
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" Find path to include subdirs
set path+=**
" Display all matching when tab completing
set wildmenu
" Complete the next full match
set wildmode=full
" Show cursor position
set ruler
" show typed command
set showcmd
" show editor mode
set showmode
" show serach as we type
set incsearch
" Tell vim we have a fast terminal
set ttyfast
" Set undofile locations
set undodir=/tmp
" Load undo files on read
set undofile
" Reload file if we run a command
set autoread
" Show cursor
set cursorline
" English!
set spelllang=en_us
" Allow local filetype vars
filetype plugin on
" Mouse support breaks copy paste for me
" set mouse+=a

" ==================================
"               Disabled
" ==================================
" No bad habits
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" ==================================
"               Formatting
" ==================================
" set indentation rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
" ==================================
"               Keymaps
" ==================================
" Set leader key
let mapleader=" "
" quit window hotkey
nnoremap <leader>q :q<CR>
" Shift tab = real tab
inoremap <S-Tab> <C-V><Tab>
" Center movement
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Buffer stuff
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <leader>b :buffers<CR>
nnoremap <leader>bd :bdelete<CR>
" Window resizing
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
" ctags
" apt install exuberant-ctags
nnoremap <leader>tb :!ctags .<CR>
nnoremap <leader>tl :tags<CR>
" ==================================
"          Internet Search
" ==================================
" Search internet for word under cursor, CTRL+R CTRL+W will insert the word under the cursor
nnoremap <leader>siw :!open https://duckduckgo.com/?q=<C-R><C-W><CR>
" ==================================
"               Filebrowser
" ==================================
let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" ==================================
"               Plugins
" ==================================
" Comment out by default
"
" call plug#begin()
" Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-repeat'
" Plug 'airblade/vim-gitgutter'
" Plug 'https://github.com/joshdick/onedark.vim.git'
" call plug#end()
" color onedark
