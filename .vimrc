" A collection of configurations for vim largely borrowed from:
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" https://github.com/greg0ire/more-instantly-better-vim
"
" Ensure runtimepath is good...
set rtp+=~/.vim/bundle
set rtp+=~/.config/nvim/bundle

" pathogen requirements
set nocompatible
execute pathogen#infect()
" some plugins we might want to consider...
" https://github.com/scrooloose/nerdtree.git
" https://github.com/vim-airline/vim-airline.git
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/tpope/vim-commentary.git
" https://github.com/tpope/vim-surround.git
" https://github.com/terryma/vim-expand-region.git

" filetype handling
filetype off
filetype plugin indent on

" Colors
set background=light
let g:solarized_termcolors=256
colorscheme solarized
syntax enable

" User Interface Improvements
let mapleader = "\<Space>"
set nu
set ruler
set whichwrap+=<,>,h,l
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set encoding=utf-8

" On the fence about the these 'controversial' features...
set lazyredraw " so far, haven't noticed any problems with this
set magic " so far, really like magic...

" Smart Indentation for the defined words below, pretty much pythonic
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Highlighting unnecessary white space
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

""" Python
"" Extra Python Syntax Highlights
" let python_highlight_all = 1

"" Pep-8 Standards
" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
set colorcolumn=80
highlight MaximumDocString ctermbg=lightred guibg=lightred
call matchadd('MaximumDocString', '\%73v')

" https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces
set timeoutlen=1000 ttimeoutlen=0
set tabstop=4
set shiftwidth=4
set expandtab

" Mistakes are made
map q: :q
:command Q q
:command W w

" Especially good while getting used to the Kinesis Advantage
map c <Nop> " What is this key even for?
map C <Nop>

" Later remapped to Capslock in macOS Sierra, so whatever.
inoremap <F1> <Esc>
map <F1> <Esc>
map <F5> :tabp<CR>
map <F6> :tabn<CR>
map <F7> :tabe

" Better selecting
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Jump to end of pasted  pasted content
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" From a talk by Damian Conway
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

" Spelling. Y'know, for documentation and stuff.
function! ToggleSpelling()
    if &spell
        echom "<( ^ _ ^ )> Spell it however you'd like!"
        set nospell
    else
        echom "<( o . o )> Spell it right!"
        set spell spelllang=en_us
    endif
endfunction

noremap <leader>s :call ToggleSpelling()<cr>

" Didn't even know paste was a thing until observing the great Rob Sletten
function! TogglePaste()
    if &paste
        echom "<( o . o )> Stop Pasting!"
        set nopaste
    else
        echom "<( ^ _ ^ )> Paste Away!"
        set paste
    endif
endfunction
noremap <leader>c :call TogglePaste()<cr>
