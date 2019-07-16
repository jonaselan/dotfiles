" Install vim-plugin                                                                                                                                                                                               
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'mhinz/vim-signify'

call plug#end()

" Configure NERDTree
" autocmd vimenter * NERDTree
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set autoindent
set tabstop=2       " The width of a TAB is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
" show number in lef
set number          
set wildmenu
set showcmd
" Enable use of the mouse for all modes
" set mouse=ai
" Always display the status line, even if only one window is displayed
set laststatus=2
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
set cursorline
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
