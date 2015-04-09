"*****************************************
" Syntastic

  "*********************
  " Config
  "
  let g:syntastic_stl_format = '%E{Err:%e}%B{ | }%W{Warn:%w}'
  let g:syntastic_enable_signs = 1
  let g:syntastic_auto_loc_list=0
  let g:syntastic_loc_list_height=3
  let g:syntastic_python_checker_args = "--max-complexity 13"
  let g:syntastic_python_flake8_args = "--max-complexity 13"
  let python_highlight_all = 1
  let g:syntastic_check_on_open=1
  let g:syntastic_check_on_wq=0
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'


  run SyntasticEnable ruby
  run SyntasticEnable eruby
  run SyntasticEnable c
  run SyntasticEnable cpp
  run SyntasticEnable coffee
  run SyntasticEnable css
  run SyntasticEnable cucumber
  run SyntasticEnable sass
  run SyntasticEnable haml
  run SyntasticEnable less
  run SyntasticEnable html
  run SyntasticEnable xhtml
  run SyntasticEnable javascript
  run SyntasticEnable sh
  run SyntasticEnable python
