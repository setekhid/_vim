execute pathogen#infect()
syntax on
filetype plugin indent on

set smartindent
set tabstop=4
set shiftwidth=4
"set expandtab
"set ruler
set hls

"set foldlevel=99

nmap <F8> :TagbarToggle<CR>

let g:syntastic_mode_map = { 'mode': 'passive' }
nmap <Leader>sc :SyntasticCheck<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
