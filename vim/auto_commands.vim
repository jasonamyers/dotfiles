if has("autocmd")
" Autoload Filetypes:
  autocmd BufRead,BufNewFile {COMMIT_EDITMSG} setf gitcommit
  autocmd BufRead,BufNewFile {*.clj} setf clojure

  autocmd BufRead,BufNewFile {gitconfig} setf gitconfig

" Automagically Save Files When Focus Is Lost But Ignore Any Warnings:
  autocmd BufLeave,FocusLost,WinLeave,CmdwinLeave * silent! wall

" Spell Check When Writing Commit Logs:
  autocmd FileType svn,*commit*,asciidoc setlocal spell

" Remove Trailing Whitespace On Save:
  autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" Setup File Specific Settings:
  autocmd BufRead,BufNewFile *.txt call g:PersonalVim_SetupWrapping()

" Jump To Last Known Cursor Position When Opening A File:
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

" Resize Splits When The Window Is Resized:
  autocmd VimResized * exe "normal! \<c-w>="

" Set different tab stops for html files
  autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
  autocmd FileType asciidoc set wrap

" Automatically chmod +x Shell scripts
  au BufWritePost   *.sh             !chmod +x %

" Set Filetype automatically to HTML if the extension is jinja2
  au BufNewFile,BufRead *.jinja2 set filetype=html

" Turn on Rainbow Parenthesis by default
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces

" Ensure SimplyFold is loaded properly
  autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
  autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
end
