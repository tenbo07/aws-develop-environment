default[:neobundle][:plugin] = [
  "Shougo/neobundle.vim",
  "Shougo/vimproc",
  "Shougo/vimshell",
  "Shougo/unite.vim",
  "Shougo/neosnippet",
  "Shougo/neosnippet-snippets",
  "Shougo/neocomplcache",
  "AndrewRadev/switch.vim",
  "alpaca-tc/alpaca_tags"
]

default[:vimset][:neocomplcache] = <<"EOS"
set completeopt=menuone
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
let g:neocomplcache_max_list = 20
let g:neocomplcache_min_syntax_length = 3
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
          return neocomplcache#smart_close_popup() . "\\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\\<Down>" : "\\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\\<Up>" : "\\<S-TAB>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

EOS
