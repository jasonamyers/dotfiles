"*****************************************
" TagBar

  "*********************
  " Config
  "
  let g:tagbar_iconchars = ['▾', '▸']
  let g:tagbar_autofocus = 1
  let g:tagbar_compact = 1

  "*********************
  " Keymappings
  "
  nnoremap <F8> :TagbarToggle<CR>
  inoremap <F8> <Esc>:TagbarToggle<CR>
