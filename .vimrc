set backspace=indent,eol,start
set number
set nocompatible
set autoindent
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-airline/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'plasticboy/vim-markdown'
Plugin 'rakr/vim-one'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
call vundle#end()
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"Credit joshdick
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
"set background=dark " for the dark version
" set background=light " for the light version
"colorscheme one
"colorscheme one
"set background=dark
colorscheme one
"set background=dark
syntax enable
set laststatus=2
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:one_allow_italics=1
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
if exists($TMUX)
    set t_8b=^[[48;2;%lu;%lu;%lum
    set t_8f=^[[38;2;%lu;%lu;%lum
endif
