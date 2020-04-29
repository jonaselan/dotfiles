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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'

set encoding=UTF-8

call plug#end()

map <C-i> :PlugInstall<CR>

" Configure NERDTree
" autocmd vimenter * NERDTree
nmap <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" setup fzf 
nnoremap <c-p> :Files<cr>
" nnoremap <c-f> :Rg<space>

"" ctrl-f for search
map <c-f> /

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader="\<space>"

" Fast saving
nmap <leader>w :w!<cr>
" Fast exit/saving
nmap <leader>x :x<cr>
" search things and 'cs' to replace
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set ai "auto indent
set si "smart indent
set wrap "wrap lines
set tabstop=2       " the width of a tab is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
" show number in lef
" set number         
set relativenumber
set wildmenu
set showcmd
" Enable use of the mouse for all modes
set mouse=ai
" Always display the status line, even if only one window is displayed
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
set cursorline
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set magic               " For regular expressions turn magic on
