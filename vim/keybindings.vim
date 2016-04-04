" Map Leader
let mapleader = ","

" Move To The First Non Whitespace Character Then To The First Column:
nmap <silent> 0 :call g:PersonalVim_ToggleHomeKey()<CR>

" Move To The Last Non Whitespace Character Then To The First Column:
nmap <silent> $ :call g:PersonalVim_ToggleEndKey()<CR>

" Yank From The Cursor To The End Of The Line:
nnoremap Y y$

" Yanking In Visual Mode Leaves Cursor At The Same Location:
vnoremap y ygv<esc>

" Always Use Paste Mode When Putting A Buffer:
nnoremap <silent> p :set paste<CR>p:set nopaste<CR>
nnoremap <silent> P :set paste<CR>P:set nopaste<CR>
set pastetoggle=<F3>

" Toggle Search Highlighting:
nnoremap <silent> // :silent :nohlsearch<CR>

" Copy Current Path And Filename To Clipboard:
nnoremap <silent> <leader>cp :let @* = expand("%:p")<CR>
nnoremap <silent> <leader>CP :let @* = expand("%:p:h") . "/"<CR>

" Open Syntastics Error List:
nnoremap <silent> <leader>e :Errors<CR>

" Close Syntastics Error List If Below:
nnoremap <silent> <leader>E <C-W>j :bd<CR>

" Move Around Via Methods:
nmap <silent> } }zzzv
nmap <silent> { {zzzv

" Mimic Unimpaired Style For Navigating Tabs:
noremap <silent>[r :bp<CR>
noremap <silent>]r :bn<CR>
noremap <silent>[R <C-O>:bfirst<CR>
noremap <silent>]R <C-O>:blast<CR>

" Mimic Unimpaired Style For Navigating Cursor History:
nnoremap <silent>[i <C-O>
nnoremap <silent>]i <C-I>

" Tags:
" Jump To Tag In A Vertical Split:
nnoremap <silent> gr :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" Show The Syntax Highlight Names Under The Cursor:
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Create Window Splits Easier:
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable Arrow Keys For Criminies:
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Refresh Vim In Various Ways:
nnoremap <silent> <leader>r :call g:PersonalVim_Refresh()<CR>

" Google For The Word Under The Curson:
nnoremap gl :set operatorfunc=g:PersonalVim_GoogleOperator<CR>g@
vnoremap gl :<C-u>call g:PersonalVim_GoogleOperator(visualmode())<CR>

" This rewires n and N to do the highlighing:
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" Enable folding with the spacebar
nnoremap <space> za

" Ctrl-P tag search
nnoremap <leader>. :CtrlPTag<cr>
