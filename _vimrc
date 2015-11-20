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

set tags=tags;/

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

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

"config merlin for ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

"disable auto gofmt while saving
let g:go_fmt_autosave = 0
