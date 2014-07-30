"*****************************************
" GitV

  "*********************
  " Config
  "
  " Load Bigger Commit Batches:
  let g:Gitv_CommitStep=300

  " Be Smart About Whether To Open The Browser In A Horizontal Or Vertical Tab:
  let g:Gitv_OpenHorizontal='auto'

  " Mercilessly Purge All Fugitive Buffers In The Browser Tab:
  let g:Gitv_WipeAllOnClose=1

  "*********************
  " Keymappings
  "
  " Open In File Mode:
  nnoremap <leader>gV :Gitv --all<CR>

  " Open In Browser Mode:
  nnoremap <leader>gv :Gitv! --all<CR>
  vnoremap <leader>gv :Gitv! --all<CR>
