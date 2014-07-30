"*****************************************
" Fugitive

  "*********************
  " Keymappings
  "
  nnoremap <leader>gb   :Gblame<CR>
  nnoremap <leader>gs   :Gstatus<CR>
  nnoremap <leader>gd   :Gdiff<CR>
  nnoremap <leader>gmv  :Gmove<CR>
  nnoremap <leader>grm  :Gremove<CR>
  nnoremap <leader>gbr  :Gbrowse<CR>
  nnoremap <leader>gf   :!git log --follow -p %<CR>
  nnoremap <leader>gaf  :Git add -A %<CR>
  nnoremap <leader>gap  :Git add --patch<CR>
  nnoremap <leader>gc   :Gcommit<CR>

  nnoremap <silent> <leader>dg :diffget<CR>
  nnoremap <silent> <leader>dp :diffput<CR>
  nnoremap <silent> <leader>du :diffupdate<CR>
