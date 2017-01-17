"---------------------------------------------------------------
""           General Settings
"---------------------------------------------------------------
set shell=/bin/zsh

set encoding=utf-8
"set showcmd							  																		" display incomplete commands

"" Spacing
"set nowrap                          														" don't wrap lines
set tabstop=2 shiftwidth=2          														" a tab is two spaces (or set this to 4)
set backspace=indent,eol,start      														" backspace through everything in insert mode
set expandtab                       " use spaces, not tabs (optional)

" Navigation
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
set mouse=a																											" Enable use of the mouse for all modes

" Display
set number 																											" Display line numbers on the left
set ruler 																											" Display the cursor position on the last line of the screen or in the status line of a window
set laststatus=2																								" Always display the status line, even if only one window is displayed
set cmdheight=2																									" Set the command window height to 2 lines, to avoid many cases of having to 'press <Enter> to continue'

"" Searching
set hlsearch                            												" highlight matches
set incsearch                           												" incremental searching
set ignorecase                          												" searches are case insensitive...
set smartcase                           												" ... unless they contain at least one capital letter
nnoremap <silent> <C-a> :nohl<CR><C-l>  " <Ctrl-a> redraws the screen and removes any search highlighting.

"" Use system clipboard
set clipboard+=unnamedplus

"---------------------------------------------------------------
""           Plugin Settings
"---------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'NLKNguyen/papercolor-theme'
"Plug 'gosukiwi/vim-atom-dark'

" Aesthetics
Plug 'vim-airline/vim-airline'        " A cooler status bar at the bottom
Plug 'vim-airline/vim-airline-themes' " A cooler status bar at the bottom
Plug 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plug 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
Plug 'valloric/MatchTagAlways'        " Highlight matching tags
Plug 'sheerun/vim-polyglot'           " Language support

" General
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file searching
let g:ctrlp_working_path_mode = 'ra'   " Default local working directory


"Plug 'leafgarland/typescript-vim'                                 " Typescript syntax highlighting
"Plug 'Shougo/vimproc', {'do' : 'make'} | Plug 'Quramy/tsuquyomi'  " Tsuquyomi (typescript plugin) depends on vimproc

"Plug 'Valloric/YouCompleteMe'                                     " Autocomplete
" autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
call plug#end()

"---------------------------------------------------------------
""           Plugin Settings
"---------------------------------------------------------------

"" Tsuquyomi
" show tooltip
"autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" disable default tsuquyomi keymappins
"let g:tsuquyomi_disable_default_mappings = 1

"" YouCompleteMe
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_register_as_syntastic_checker = 0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview

"---------------------------------------------------------------
""             Display
"---------------------------------------------------------------

syntax enable

" vim atom dark
set background=dark
colorscheme PaperColor

