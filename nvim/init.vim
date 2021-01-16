" YJDev nvim config .vimrc file
"python3 test with : has("python3")
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python'

" Hightlight Current Line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" Plug section
" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim',
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Yggdroot/indentLine',
Plug 'chun-yang/auto-pairs'
call plug#end()

" Theme
colorscheme dracula

"Nerdtree config
autocmd VimEnter * NERDTree
"Auto close Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

"Indent Line config
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"Basic configs
syntax on
set number 

"COC EXTENSIONS
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint', 
\ 'coc-prettier', 
\ 'coc-json',
\ 'coc-css',
\ 'coc-html'
\ ]
