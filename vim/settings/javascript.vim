"*****************************************
" Javascript

  "*********************
  " Auto Commands
  "
  if has("autocmd")
    autocmd BufRead,BufNewFile {*.json} setf javascript
  end
