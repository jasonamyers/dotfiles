"*****************************************
" Quickfix Signs

  "*********************
  " Config
  "
  let g:quickfixsigns#marks#buffer = split('abcdefghijklmnopqrstuvwxyz', '\zs')
  let g:quickfixsigns#marks#global = split('BCDEFGHIJKLMNOPQRSTUVWXYZ<>^', '\zs')

  "*********************
  " Auto Commands
  "
  if has("autocmd")
    autocmd BufEnter * exec "QuickfixsignsSet"
  end
