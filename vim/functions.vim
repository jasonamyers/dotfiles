function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Used with an autocommand to wrap lines on certain filetypes
function! g:PersonalVim_SetupWrapping()
  setlocal formatoptions+=t
endfunction

" Used with an autocommand to prepare markdown buffers for previewability
function! g:PersonalVim_SetupMarkup()
  call g:PersonalVim_SetupWrapping()
endfunction

function! Preserve(command)
" Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    execute a:command
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! g:PersonalVim_Refresh()
  let currBuff=bufnr("%")
  checktime
  ClearCtrlPCache
  bufdo QuickfixsignsSet
  execute 'buffer ' . currBuff
endfunction

" http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()

function! QuickfixFilenames()
" Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function! g:PersonalVim_ToggleHomeKey()
  let l:col = col('.') " current pos
" goto non whitespace start of line
  execute 'normal! ^'
  if col('.') == l:col " if current pos == non whitespace start of line
    call cursor(line('.'), 1) " move to beginning
  endif
endfunction

function! g:PersonalVim_ToggleEndKey()
  let l:col = col('.') " current pos
" goto non whitespace end of line
  execute 'normal! g_'
  if col('.') == l:col " if current pos == non whitespace EOL
" move to whitespace EOL
    execute 'normal! $'
  endif
endfunction

function! g:PersonalVim_GoogleOperator(type)
  let saved_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  silent execute "! open " . shellescape("https://www.google.com/search?q=" . @@)
  let @@ = saved_register
  redraw!
endfunction

highlight WhiteOnRed ctermbg=red ctermfg=white
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction
