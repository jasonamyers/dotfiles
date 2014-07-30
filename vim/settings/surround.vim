"*****************************************
" Surround

  "*********************
  " Config
  "
  let g:surround_{char2nr('#')} = "#{\r}"               " Surround with Ruby #{}
  let g:surround_{char2nr('%')} = "<% \r %>"            " Surround with ERB <% %>
  let g:surround_{char2nr('-')} = "<% \r -%>"           " Surround with ERB <% -%>
  let g:surround_{char2nr('/')} = "<%# \r %>"           " Surround with ERB <%# %>
  let g:surround_{char2nr('"')} = "\"\r\""              " Override Ragtag's Surround.vim shortcut
  let g:surround_{char2nr('=')} = "<%= \r %>"           " Surround with ERB <%= %>
  let g:surround_{char2nr(':')} = ":\r"                 " To Change a String To A Symbol

  "*********************
  " Keymappings
  "
  " Use The Old Surround Visual Keymapping:
  xmap s S
