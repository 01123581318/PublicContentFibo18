" Vim configuration file
" 2020-04-29

" Set the preferred colorscheme
colorscheme evening

" Use the mouse, but will select now in vim visual instead of normally
set mouse=a

" Enable more colors
set t_Co=256

" Enable text folding on indent u can use za to fold
set foldmethod=indent

"Unfold by default
set foldlevel=99

" Auto detect the filetype and configure settings accordingly
filetype indent plugin on

" Background info
"set background=dark

"Enable syntax highlighting
syntax on

"Better completion of commands
set wildmenu

"Keep indentation level for new line by default
set autoindent

"Print out the line numbers
set number

"Smart indentation for better autoalignment
set smarttab

" PEP Style Guide (remember to use 2 lines of space between func etc.)
au Filetype python set

" Lines longer than 79 columns will be broken
            \ textwidth=79

"Number of spaces per tab
            \ tabstop=4

"Number of spaces per tab while editing
            \ softtabstop=4

"For reiindentation (<< or >>)
            \ shiftwidth=4

"Convert tabs to spaces
            \ expandtab
            
"""
"use these commands occasionally:
" Will show relative line numbers and absolute line numbers
" set rnu
" set nornu

" adds sub and sub sub paths to the path
set path+=**

" enables vim new feature's over vi
set nocompatible

" TAG JUMPING:

" Create the `tags` file by ":MakeTag" (may need to install ctags first)
command! MakeTags !/usr/local/Cellar/ctags/5.8_2/bin/ctags -R .

" Tweaks for browsing file/folder tree
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
" nnoremap is keyremapping non self calling in normal mode
" ,html is what you need to insert the snippet
" :-1read will read from a file but insert it 1 line down
" $Home... is path to the snippet 
" <CR> is the enter keyword 
" 3jwf>a are normal commands to execute aswell

" CUSTOM MAPPING:
" better yet to use make and get error tracking
" These will auto create map for filetype python to run files code in py3 by <F5> click
" map for running it in normal mode
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" imap for running in insert mode 
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" calling make to make single file projects
autocmd FileType c nnoremap <silent> <f7> :w<CR> :make <CR> :copen<CR>
autocmd FileType Java nnoremap <silent> <f7> :w<CR> :!javac ./%<.java <CR>
" calling make and only running after sucess, changed from make %<
autocmd FileType c nnoremap <silent> <f8> :w<CR> :make <CR> :!./%<<CR>
autocmd FileType Java nnoremap <silent> <f8> :w<CR> :!javac ./%<.java <CR> :!java %< <CR>
" using :cN and :cn to navigate errors, makefile if neccessary for larger
nnoremap <silent> <f9> :cp<CR>
nnoremap <silent> <f10> :cn<CR>
