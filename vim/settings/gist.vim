"*****************************************
" Gist

  "*********************
  " Config
  "
  if executable("pbcopy")
    let g:gist_clip_command = 'pbcopy'
  elseif executable("xclip")
    let g:gist_clip_command = 'xclip -selection clipboard'
  elseif executable("putclip")
    let g:gist_clip_command = 'putclip'
  end

  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1
  let g:gist_show_privates = 1

  "*********************
  " Keymappings
  "
  " Send visual selection to gist.github.com as a private, filetyped Gist
  vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>

  " Send visual selection to gist.github.com as a public, filetyped Gist
  vnoremap <leader>GP :w !gist -P -t %:e \| pbcopy<cr>

  " Show the Gist list
  noremap <F12> :Gist -l<CR>
