"*****************************************
" Tabularize

  "*********************
  " Keymappings
  "
  nnoremap <leader>t,    :Tabularize /,\zs<CR>

  vnoremap <leader>t,    :Tabularize /,\zs<CR>

  nnoremap <leader>t::   :Tabularize /\s:<CR>
  vnoremap <leader>t::   :Tabularize /\s:<CR>
  nnoremap <leader>t=    :Tabularize /=>\@!<CR>
  vnoremap <leader>t=    :Tabularize /=>\@!<CR>
  nnoremap <leader>t=>   :Tabularize /=><CR>
  vnoremap <leader>t=>   :Tabularize /=><CR>
  nnoremap <leader>t->   :Tabularize /-><CR>
  vnoremap <leader>t->   :Tabularize /-><CR>
  nnoremap <leader>t{    :Tabularize /{<CR>
  vnoremap <leader>t{    :Tabularize /{<CR>
  nnoremap <leader>t}    :Tabularize /}<CR>
  vnoremap <leader>t}    :Tabularize /}<CR>
  nnoremap <leader>t:    :Tabularize /^[^:]*:.\zs/l0l1l0<CR>
  vnoremap <leader>t:    :Tabularize /^[^:]*:.\zs/l0l1l0<CR>

  "*********************
  " Custom Functions
  "
  " Tabularize Auto Table Styling:
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  " Tabularize Auto Table Styling:
  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction
