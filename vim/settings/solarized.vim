" *******************************
" Solarized


let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="high"
let g:solarized_contract="high"

" Make if statements and def statements similar
hi! link rubyDefine rubyControl

" This is a better cursor
hi! link Cursor VisualNOS

" This is a bit nicer visual selection
hi! link Visual DiffChange

" Search is way too distracting in original Solarized
hi! link Search DiffAdd

" Colors to make LustyJuggler more usable
hi! clear Question
hi! Question guifg=yellow

hi! link TagListFileName  Question

" For jasmine.vim
hi! link specFunctions rubyDefine
hi! link specMatcher rubyConstant
hi! link specSpys rubyConstant

" Ruby, slightly better colors for solarized
hi! link rubyStringDelimiter rubyConstant
hi! link rubyInterpolationDelimiter rubyConstant
hi! link rubySymbol rubyBlockParameter

" For R and other languages that use Delimiters, we don't want them red
hi! link Delimiter Identifier
hi! link rDollar Identifier

" For vimscript, don't like red
hi! link vimMapModKey Operator
hi! link vimNotation Label

" Better json highlighting
hi! link htmlArg Label
