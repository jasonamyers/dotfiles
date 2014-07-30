" Vim color file
" Converted from Textmate theme Scratch Art using Coloration v0.2.4 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "scratched"

hi Cursor  guifg=NONE guibg=#a6a6a6 gui=NONE
hi Visual  guifg=NONE guibg=#253b76 gui=NONE
hi CursorLine  guifg=NONE guibg=#0d0d0d gui=NONE
hi CursorColumn  guifg=NONE guibg=#0d0d0d gui=NONE
hi LineNr  guifg=#7c7c7c guibg=#000000 gui=NONE
hi VertSplit  guifg=#2f2f2f guibg=#2f2f2f gui=NONE
hi MatchParen  guifg=#0080ff guibg=NONE gui=NONE
hi StatusLine  guifg=#f8f8f8 guibg=#2f2f2f gui=bold
hi StatusLineNC  guifg=#f8f8f8 guibg=#2f2f2f gui=NONE
hi Pmenu  guifg=#80ff00 guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#253b76 gui=NONE
hi IncSearch  guifg=NONE guibg=#540054 gui=NONE
hi Search  guifg=NONE guibg=#540054 gui=NONE
hi Directory  guifg=#ffffbb guibg=NONE gui=NONE
hi Folded  guifg=#008000 guibg=#000000 gui=NONE

hi Normal  guifg=#f8f8f8 guibg=#000000 gui=NONE
hi Boolean  guifg=#ffffbb guibg=NONE gui=NONE
hi Character  guifg=#ffffbb guibg=NONE gui=NONE
hi Comment  guifg=#008000 guibg=NONE gui=NONE
hi Conditional  guifg=#0080ff guibg=NONE gui=NONE
hi Constant  guifg=#ffffbb guibg=NONE gui=NONE
hi Define  guifg=#0080ff guibg=NONE gui=NONE
hi ErrorMsg  guifg=#f8f8f8 guibg=#9d1e15 gui=NONE
hi WarningMsg  guifg=#f8f8f8 guibg=#9d1e15 gui=NONE
hi Float  guifg=#ffffbb guibg=NONE gui=NONE
hi Function  guifg=#80ff00 guibg=NONE gui=NONE
hi Identifier  guifg=#0080ff guibg=NONE gui=bold
hi Keyword  guifg=#0080ff guibg=NONE gui=NONE
hi Label  guifg=#ff8000 guibg=NONE gui=NONE
hi NonText  guifg=#404040 guibg=#0d0d0d gui=NONE
hi Number  guifg=#ffffbb guibg=NONE gui=NONE
hi Operator  guifg=#0080ff guibg=NONE gui=NONE
hi PreProc  guifg=#0080ff guibg=NONE gui=NONE
hi Special  guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey  guifg=#404040 guibg=#0d0d0d gui=NONE
hi Statement  guifg=#0080ff guibg=NONE gui=NONE
hi StorageClass  guifg=#0080ff guibg=NONE gui=bold
hi String  guifg=#ff8000 guibg=NONE gui=NONE
hi Tag  guifg=#80ff00 guibg=NONE gui=NONE
hi Title  guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo  guifg=#008000 guibg=NONE gui=inverse,bold
hi Type  guifg=#80ff00 guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#0080ff guibg=NONE gui=NONE
hi rubyFunction  guifg=#80ff00 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#ffffbb guibg=NONE gui=NONE
hi rubyConstant  guifg=#80ff00 guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#ff8000 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#ff00ff guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#ff00ff guibg=NONE gui=NONE
hi rubyInclude  guifg=#0080ff guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#ff00ff guibg=NONE gui=NONE
hi rubyRegexp  guifg=#f85194 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#f85194 guibg=NONE gui=NONE
hi rubyEscape  guifg=#ffffbb guibg=NONE gui=NONE
hi rubyControl  guifg=#0080ff guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#ff00ff guibg=NONE gui=NONE
hi rubyOperator  guifg=#0080ff guibg=NONE gui=NONE
hi rubyException  guifg=#0080ff guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#ff00ff guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#80ff00 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#80ff00 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#80ff00 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#80ff00 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#80ff00 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#008000 guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#80ff00 guibg=NONE gui=NONE
hi htmlTag  guifg=#f3eb2f guibg=NONE gui=NONE
hi htmlEndTag  guifg=#f3eb2f guibg=NONE gui=NONE
hi htmlTagName  guifg=#f3eb2f guibg=NONE gui=NONE
hi htmlArg  guifg=#f3eb2f guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#ffffbb guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#0080ff guibg=NONE gui=bold
hi javaScriptRailsFunction  guifg=#80ff00 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#80ff00 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#ff00ff guibg=NONE gui=NONE
hi yamlAlias  guifg=#ff00ff guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#ff8000 guibg=NONE gui=NONE
hi cssURL  guifg=#ff00ff guibg=NONE gui=NONE
hi cssFunctionName  guifg=#80ff00 guibg=NONE gui=NONE
hi cssColor  guifg=#ffffbb guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#80ff00 guibg=NONE gui=NONE
hi cssClassName  guifg=#80ff00 guibg=NONE gui=NONE
hi cssValueLength  guifg=#ffffbb guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#f8f800 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE

