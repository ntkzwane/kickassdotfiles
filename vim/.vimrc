call plug#begin('~/.vim/plugged')

Plug 'gosukiwi/vim-atom-dark'

Plug 'leafgarland/typescript-vim'                                 " Typescript syntax highlighting
Plug 'Shougo/vimproc', {'do' : 'make'} | Plug 'Quramy/tsuquyomi'  " Tsuquyomi (typescript plugin) depends on vimproc

Plug 'Valloric/YouCompleteMe'                                     " Autocomplete
" autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
call plug#end()

set clipboard=unnamedplus

"---------------------------------------------------------------
""           Plugin Settings
"---------------------------------------------------------------

"" Tsuquyomi
" show tooltip
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" disable default tsuquyomi keymappins
let g:tsuquyomi_disable_default_mappings = 1 

"" YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"---------------------------------------------------------------
""             Display
"---------------------------------------------------------------
" vim atom dark
colorscheme atom-dark
