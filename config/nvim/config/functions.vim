"Detect OS
function! OSX()
    return has('macunix')
endfunction
function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
function! WINDOWS()
    return (has('win16') || has('win32') || has('win64'))
endfunction
function! OnmiConfigForJsp()
    let pos1 = search("</script>","nb",line("w0"))
    let pos2 = search("<script","nb",line("w0"))
    let pos3 = search("</script>","n",line("w$"))
    let pos4 = search("<script","n",line("w$"))
    let pos0 = line('.')
    if pos1 < pos2 && pos2 < pos0 && pos0 < pos3
        set omnifunc=javascriptcomplete#CompleteJS
        return "\<esc>a."
    else
        set omnifunc=javacomplete#Complete
        return "\<esc>a."
    endif
endf
function! ToggleNumber()
    let s:isThereNumber = &nu
    let s:isThereRelativeNumber = &relativenumber
    if s:isThereNumber && s:isThereRelativeNumber
        set paste!
        set nonumber
        set norelativenumber
    else
        set paste!
        set number
        set relativenumber
    endif
endf
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
function! BracketsFunc()
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "]"
        return "{}\<esc>i"
    else
        return "{\<cr>}\<esc>O"
    endif
endf
function! XmlFileTypeInit()
    set omnifunc=xmlcomplete#CompleteTags
    if filereadable("AndroidManifest.xml")
        set dict+=~/.vim/bundle/vim-dict/dict/android_xml.dic
    endif
endf
function! JavaFileTypeInit()
    set omnifunc=javacomplete#Complete
    set tags +=~/others/openjdksrc/java/tags
    set tags +=~/others/openjdksrc/javax/tags
    inoremap <silent> <buffer> <leader>UU <esc>bgUwea
    inoremap <silent> <buffer> <leader>uu <esc>bguwea
    inoremap <silent> <buffer> <leader>ua <esc>bgulea
    inoremap <silent> <buffer> <leader>Ua <esc>bgUlea
    nmap <silent><buffer> <F4> <Plug>(JavaComplete-Imports-Add)
    imap <silent><buffer> <F4> <Plug>(JavaComplete-Imports-Add)
endf
function! WSDAutoComplete(char)
    if(getline(".")=~?'^\s*.*\/\/')==0
        let line = getline('.')
        let col = col('.')
        if a:char == "."
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 2] == " "||line[col -2] == "("||line[col - 2] == ","
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 3] == " "&&line[col - 2] =="@"
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return a:char
        endif
    else
        "bug exists
        let col = col('.')
        normal! ma
        let [commentline,commentcol] = searchpos('//','b',line('.'))
        normal! `a
        if commentcol == 0
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return "\<Right>".a:char
        endif
    endif
endf
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<Esc>j0f}a"
    endif
endf

function! QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        "Escaping out of the string
        return "\<Right>"
    else
        "Starting a string
        return a:char.a:char."\<Esc>i"
    endif
endf
function! JspFileTypeInit()
    set tags+=/home/wsdjeg/others/openjdk-8-src/tags
    set omnifunc=javacomplete#Complete
    inoremap . <c-r>=OnmiConfigForJsp()<cr>
    nnoremap <F4> :JCimportAdd<cr>
    inoremap <F4> <esc>:JCimportAddI<cr>
endfunction
function! MyTagfunc() abort
    mark H
    let s:MyTagfunc_flag = 1
    UniteWithCursorWord -immediately tag
endfunction

function! MyTagfuncBack() abort
    if exists('s:MyTagfunc_flag')&&s:MyTagfunc_flag
        exe "normal! `H"
        let s:MyTagfunc_flag =0
    endif
endfunction

function! MyEnterfunc() abort
    if pumvisible()
        if getline('.')[col('.') - 2]=="{"
            return "\<Enter>"
        elseif g:settings.autocomplete_method == 'neocomplete'||g:settings.autocomplete_method == 'deoplete'
            return "\<C-y>"
        else
            return "\<esc>a"
        endif
    elseif getline('.')[col('.') - 2]=="{"&&getline('.')[col('.')-1]=="}"
        return "\<Enter>\<esc>ko"
    else
        return "\<Enter>"
    endif
endf

function! MyLeaderTabfunc() abort
    if g:settings.autocomplete_method == 'deoplete'
        return deoplete#mappings#manual_complete(['omni'])
    elseif g:settings.autocomplete_method == 'neocomplete'
        return neocomplete#start_manual_complete(['omni'])
    endif
endfunction

function! MyTabfunc() abort
    if getline('.')[col('.')-2] =='{'&& pumvisible()
        return "\<C-n>"
    endif
    if neosnippet#expandable() && getline('.')[col('.')-2] =='(' && !pumvisible()
        return "\<Plug>(neosnippet_expand)"
    elseif neosnippet#jumpable() && getline('.')[col('.')-2] =='(' && !pumvisible() && !neosnippet#expandable()
        return "\<plug>(neosnippet_jump)"
    elseif neosnippet#expandable_or_jumpable() && getline('.')[col('.')-2] !='('
        return "\<plug>(neosnippet_expand_or_jump)"
    elseif pumvisible()
        return "\<C-n>"
    else
        return "\<tab>"
    endif
endfunction
func! Openpluginrepo()
    try
        exec "normal! ".'"ayi'."'"
        exec 'OpenBrowser https://github.com/'.@a
    catch
        echohl WarningMsg | echomsg "can not open the web of current plugin" | echohl None
    endtry
endf
func! Update_current_plugin()
    try
        exec "normal! ".'"ayi'."'"
        if match(@a, '/') >= 0
            exec 'call dein#update(["' . split(@a,'/')[1] . '"])'
        else
            exec 'call dein#update(["' . @a . '"])'
        endif
    catch
        echohl WarningMsg | echomsg "can not open the web of current plugin" | echohl None
    endtry
endf
func! Show_Log_for_current_plugin()
    try
        exec "normal! ".'"ayi'."'"
        exec "call unite#start([['output/shellcmd',"
                    \ ."'git --no-pager -C ~/.cache/vimfiles/repos/github.com/"
                    \ . @a
                    \ . " log -n 15 --oneline']], {'log': 1, 'wrap': 1,'start_insert':0})"
    catch
        echohl WarningMsg | echomsg "can show logs of current plugin" | echohl None
    endtry
endf
