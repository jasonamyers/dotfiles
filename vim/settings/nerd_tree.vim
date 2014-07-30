"*****************************************
" NERDTree

  "*********************
  " Config
  "
  let NERDChristmasTree = 1                             " Enable nice colors
  let NERDTreeHighlightCursorline = 1                   " Make it easy to see where we are
  let NERDTreeShowBookmarks = 1                         " Make bookmarks visible
  let NERDTreeShowHidden = 1                            " Show hidden files
  let NERDTreeHijackNetrw = 0                           " Don't hijack NETRW
  let NERDTreeChDirMode = 2                             " Update the PWD to whatever the root of the tree is
  let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o', '\.$', '\~$']

  "*********************
  " Keymappings
  "
  " Toggle NERDTree:
  nnoremap <F2> :NERDTreeToggle<CR>
  inoremap <F2> <Esc>:NERDTreeToggle<CR>

  " Find The Current File In NERDTree:
  nnoremap <silent> <C-F2> :NERDTreeFind<CR>
