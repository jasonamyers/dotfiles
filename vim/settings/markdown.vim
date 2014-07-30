"*****************************************
" Markdown

  "*********************
  " Auto Commands
  "
  if has("autocmd")
    autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} setf markdown
    autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call g:PersonalVim_SetupMarkup()
  end
