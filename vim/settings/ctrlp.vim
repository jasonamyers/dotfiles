"*****************************************
" CtrlP

  "*********************
  " Config
  "
  " Show Window At Top Of Screen:
  let g:ctrlp_match_window_bottom = 0

  " Reverse Listing So Match Is At The Top:
  let g:ctrlp_match_window_reversed = 0

  " Default To Full Path Searches:
  let g:ctrlp_by_filename = 0

  " Remap Search Key:
  let g:ctrlp_map = ',t'

  " Give Us More Height:
  let g:ctrlp_max_height = 30

  " Show MRU Based On Last Time Used:
  let g:ctrlp_mruf_last_entered = 1

  " Do Not Search Dotfiles:
  let g:ctrlp_dotfiles = 0

  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

  let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "coverage/|log/|tmp/|deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/" .
    \ ")'"

  if has("unix")
    let my_ctrlp_user_command = "" .
      \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
      \ ctrlp_filter_greps
  endif

  let g:ctrlp_user_command = ['.git/', my_ctrlp_user_command]

  "*********************
  " Keymappings
  "
  " Refresh The Cache:
  nnoremap <silent> <leader>T :CtrlPTag<cr>


  if has("gui_macvim") && has("gui_running")
    " Additional Mapping For Buffer Search:
    noremap <D-T> :CtrlPBuffer<cr>

    " Change Apple T To TextMate Like Fuzzy Finder:
    noremap <D-t> :CtrlP<CR>
  end
