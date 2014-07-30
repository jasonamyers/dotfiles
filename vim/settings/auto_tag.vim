"*****************************************
" AutoTag

"*********************
" Config
"
  if executable('ctags') == 0
    let g:autotagDisabled = 1
  endif

  let g:autotagCtagsCmd = 'ctags --extra=+f --fields=+iaS'
  let g:autotagVerbosityLevel = 0
  let g:autotagMaxTagFileSize = 50
