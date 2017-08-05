" $Id: .vimrc,v 1.7 2002/03/13 08:24:36 crow Exp $
"
" tfoldi's vimrc, 2001-2016
"
set nocompatible	" Use Vim defaults (much better!)
filetype off

" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'

" Fuzzy finder -- absolutely must have.
Bundle 'kien/ctrlp.vim'

" NERD Tree -- A tree explorer
Bundle 'scrooloose/nerdtree'

" Git plugin for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" awesome git plugin for vim
Plugin 'tpope/vim-fugitive'

" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'

" emmet is a high speed HTML/CSS editor
Plugin 'mattn/emmet-vim'

" Proper JSON filetype detection, and support.
Bundle 'leshill/vim-json'

" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Bundle 'pangloss/vim-javascript'

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Bundle 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Bundle 'tpope/vim-markdown'

" LessCSS -- I use this every day.
Bundle 'groenewege/vim-less'

" Coffee-script syntax.
Bundle 'kchmck/vim-coffee-script'

" Clojure and clojurescript support with alternate repl
Bundle 'guns/vim-clojure-static'

" Elm language support
Plugin 'lambdatoast/elm.vim'

" Rainbow pars
Bundle 'kien/rainbow_parentheses.vim'

" Fireplace nREPL for clojure
Bundle 'tpope/vim-fireplace'

" Code completion engine 
Plugin 'valloric/youcompleteme'

" Auto paste detection from iTerm2
Bundle 'ConradIrwin/vim-bracketed-paste'

" TagBar to view Tags
Bundle 'vladh/tagbar' 

" Buffer explorer to see open files
Bundle 'jlanzarotta/bufexplorer'

" Status bar
Bundle 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting


set tabstop=2
set shiftwidth=2
set softtabstop=2
set ts=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.


" general settings 
set showcmd
set visualbell
set ttyfast
set backspace=2 " make backspace work like most other apps

set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" Fix C++11 lambda identation issues
"setlocal cindent cino=j1,(0,ws,ws

set viminfo='20,\"50	
set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags

" Don't use Ex mode, use Q for formatting
map Q gq
cmap Q q
cmap W w

"hi Comment term=bold ctermfg=DarkMagenta guifg=SlateBlue

map <F1> <ESC>@1
map <F2> <ESC>@2
map <F3> <ESC>@3
map <F4> <ESC>@4

" paging
map <F5> <ESC>: previous
map <F6> <ESC>: next



" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","


" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" use emmet only for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Load ycm config files automatically
let g:ycm_confirm_extra_conf = 0

" NERD Tree
" Map NERDTree to Ctrl-N
map <C-n> :NERDTreeToggle<CR>
" Close vim if only NERD Tree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
"colorscheme autumnleaf

au VimEnter * RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" Toggle TagBar with F8
nmap <F8> :TagbarToggle<CR>

" Toggle Buffer explorer
nnoremap <silent> <c-F11> :BufExplorer<CR>
nmap <c-b> :BufExplorer<CR>

" compile current elm file
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" Enable status bar
set laststatus=2

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif
