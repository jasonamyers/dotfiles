"mapping
"全局映射
"也可以通过'za'打开或者关闭折叠
nnoremap <silent><leader><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"Super paste it does not work
"ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"对于没有权限的文件使用 :w!!来保存
cnoremap w!! %!sudo tee > /dev/null %
" cmap W!! w !sudo tee % >/dev/null   " I can not understand
" Save a file with sudo
" http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN


" 映射Ctrl+上下左右来切换窗口
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left>  <C-W><Left>
nnoremap <C-Up>    <C-W><Up>
nnoremap <C-Down>  <C-W><Down>
if has('nvim')
    tnoremap <C-Right> <C-\><C-n><C-w><Right>
    tnoremap <C-Left>  <C-\><C-n><C-w><Left>
    tnoremap <C-Up>    <C-\><C-n><C-w><Up>
    tnoremap <C-Down>  <C-\><C-n><C-w><Down>
    tnoremap <esc>     <C-\><C-n>
endif

"for buftabs
noremap <silent><Leader>bp :bprev<CR>
noremap <silent><Leader>bn :bnext<CR>
noremap <silent>]r :bnext<CR>
noremap <silent>[r :bprev<CR>

"Quickly add empty lines
nnoremap <silent>[<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent>]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"Use jk switch to normal model
inoremap jk <esc>

"]e or [e move current line ,count can be useed
nnoremap <silent>[e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent>]e  :<c-u>execute 'move +'. v:count1<cr>

"]<End> or ]<Home> move current line to the end or the begin of current buffer
nnoremap <silent>]<End> ddGp``
nnoremap <silent>]<Home> ddggP``
vnoremap <silent>]<End> dGp``
vnoremap <silent>]<Home> dggP``


"Ctrl+Shift+上下移动当前行
nnoremap <silent><C-S-Down> :m .+1<CR>==
nnoremap <silent><C-S-Up> :m .-2<CR>==
inoremap <silent><C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><C-S-Up> <Esc>:m .-2<CR>==gi
"上下移动选中的行
vnoremap <silent><C-S-Down> :m '>+1<CR>gv=gv
vnoremap <silent><C-S-Up> :m '<-2<CR>gv=gv
"background
noremap <silent><leader>bg :call ToggleBG()<CR>
"numbers
noremap <silent><leader>nu :call ToggleNumber()<CR>

" yark and paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Start new line
inoremap <S-Return> <C-o>o

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
    \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
    \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "H")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
    \ ."\<C-u>".(line('w0') <= 1 ? "H" : "L")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" smart up and down
nnoremap <silent><Down> gj
nnoremap <silent><Up> gk

" Select last paste
nnoremap <silent><expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Disable Q and gQ
nnoremap Q <Nop>
nnoremap gQ <Nop>

" Navigate window
nnoremap <silent><C-q> <C-w>
nnoremap <silent><C-x> <C-w>x

" Navigation in command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" When pressing <leader>cd switch to the directory of the open buffer
" map <Leader>cd :cd %:p:h<CR>:pwd<CR>       "I use <Plug>RooterChangeToRootDirectory

" Fast saving
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :<C-u>w<CR>
vnoremap <C-s> :<C-u>w<CR>
cnoremap <C-s> <C-u>w<CR>

" Toggle editor visuals
nmap <Leader>ts :setlocal spell!<cr>
nmap <Leader>tn :setlocal nonumber! norelativenumber!<CR>
nmap <Leader>tl :setlocal nolist!<CR>
nmap <Leader>th :nohlsearch<CR>
nmap <Leader>tw :setlocal wrap! breakindent!<CR>

" Tabs
nnoremap <silent>g0 :<C-u>tabfirst<CR>
nnoremap <silent>g$ :<C-u>tablast<CR>
nnoremap <silent>gr :<C-u>tabprevious<CR>

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" C-r: Easier search and replace
xnoremap <C-r> :<C-u>call VSetSearch('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Location list movement
nmap <silent><leader>lj :lnext<CR>
nmap <silent><leader>lk :lprev<CR>
nmap <silent><leader>lq :lclose<CR>
nmap <silent><leader>e :lopen<CR>

" quickfix list movement
nmap <silent><Leader>qj :cnext<CR>
nmap <silent><Leader>qk :cprev<CR>
nmap <silent><Leader>qq :cclose<CR>

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Source line and selection in vim
vnoremap <Leader>S y:execute @@<CR>:echo 'Sourced selection.'<CR>
nnoremap <Leader>S ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>

noremap <silent><leader>c :Neomake<CR>


call zvim#util#defineMap('nnoremap <silent>', '<C-c>', ':let @+=expand("%:p")<CR>:echo "Copied to clipboard."<CR>',
            \ 'Copy buffer absolute path to X11 clipboard',':let @+=expand("%:p")|echo "Copied to clipboard."')
call zvim#util#defineMap('nnoremap <silent>', '<Leader><C-c>',
            \ ':let @+="https://github.com/wsdjeg/DotFiles/blob/master/" . expand("%")<CR>:echo "Copied to clipboard."<CR>',
            \ 'Yank the github link to X11 clipboard',
            \ ':let @+="https://github.com/wsdjeg/DotFiles/blob/master/" . expand("%")|echo "Copied to clipboard."')
" Window prefix
call zvim#util#defineMap('nnoremap', '[Window]', '<Nop>'   , 'Defind window prefix'   ,'normal [Window]')
call zvim#util#defineMap('nmap'    , 's'       , '[Window]', 'Use s as window prefix' ,'normal s')

call zvim#util#defineMap('nnoremap <silent>', '<Tab>', ':wincmd w<CR>', 'Switch to another buffer','wincmd w')
call zvim#util#defineMap('nnoremap <silent>', '[Window]p', ':<C-u>vsplit<CR>:wincmd w<CR>',
            \'vsplit vertically,switch to next window','vsplit | wincmd w')
call zvim#util#defineMap('nnoremap <silent>', '[Window]v', ':<C-u>split<CR>', 'split window','split')
call zvim#util#defineMap('nnoremap <silent>', '[Window]g', ':<C-u>vsplit<CR>', 'vsplit window','vsplit')
call zvim#util#defineMap('nnoremap <silent>', '[Window]t', ':<C-u>tabnew<CR>', 'Create new tab','tabnew')
call zvim#util#defineMap('nnoremap <silent>', '[Window]o', ':<C-u>only<CR>', 'Close other windows','only')
call zvim#util#defineMap('nnoremap <silent>', '[Window]x', ':<C-u>call zvim#util#BufferEmpty()<CR>',
            \'Empty current buffer','call zvim#util#BufferEmpty()')
call zvim#util#defineMap('nnoremap <silent>', '[Window]\', ':<C-u>b#<CR>', 'Switch to the last buffer','b#')
call zvim#util#defineMap('nnoremap <silent>', '[Window]q', ':<C-u>close<CR>', 'Close current windows','close')
call zvim#util#defineMap('nnoremap <silent><expr>', 'q', "winnr('$') != 1 ? ':<C-u>close<CR>' : ''",
            \ 'Smart close windows',
            \ "exec winnr('$') != 1 ? 'close' : ''")
call zvim#util#defineMap('nnoremap <silent>', '<Leader>qr', 'q', 'Toggle recording','')
call zvim#util#defineMap('nnoremap <silent>', '<Leader>sv', ':split<CR>:wincmd p<CR>:e#<CR>',
            \'Open previous buffer in split window' , 'split|wincmd p|e#')
call zvim#util#defineMap('nnoremap <silent>', '<Leader>sg', ':vsplit<CR>:wincmd p<CR>:e#<CR>',
            \'Open previous buffer in vsplit window' , 'vsplit|wincmd p|e#')
