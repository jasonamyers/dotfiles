" ***************************
" Airline

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = '¶ '
let g:airline_enable_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_section_b="%t"
let g:airline_section_c=""
let g:airline_section_x="%{tagbar#currenttag('[%s] ','')}"
let g:airline_section_y="%{strlen(&ft)?&ft:'none'}"
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S'}
