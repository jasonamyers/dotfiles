" Setup Python for Neovim
" ---------------------------------------------------------
let g:python_host_prog = '/home/jasonamyers/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/jasonamyers/.pyenv/versions/neovim3/bin/python'

" Setup Dein (Plugin Manager)
" ----------------------------------------------------------
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))

" Language Agnostic Plugins
" ------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
call dein#add('benekastah/neomake')
" Autocomplete
call dein#add('Shougo/deoplete.nvim')
" Automatically closing pair stuff
call dein#add('cohama/lexima.vim')
" Commenting support (gc)
call dein#add('tpope/vim-commentary')
" CamelCase and snake_case motions
call dein#add('bkad/CamelCaseMotion')
" Heuristically set indent settings
call dein#add('tpope/vim-sleuth')

" Python Plugins
" ------------------------------------------------------------

" Jedi library
call dein#add('davidhalter/jedi-vim')

" Autocomplete using jedi
call dein#add('zchee/deoplete-jedi')

" Better Folding Support
call dein#add('tmhedberg/SimpylFold')

" JS (ES6, React) Plugins
" ------------------------------------------------------------

" JS syntax
call dein#add('jelera/vim-javascript-syntax')
" JS libs syntax (React, Angular)
call dein#add('othree/javascript-libraries-syntax.vim')
" Used for indentation
call dein#add('pangloss/vim-javascript')
" JSX syntax (needs vim-javascript for indentation)
call dein#add('mxw/vim-jsx')
" Typescript syntax
call dein#add('leafgarland/typescript-vim')
" JSON syntax
call dein#add('sheerun/vim-json')

" HTML/CSS Plugins
" ------------------------------------------------------------

" HTML5 syntax
call dein#add('othree/html5.vim')
" SCSS syntax
call dein#add('cakebaker/scss-syntax.vim')
" Color highlighter
call dein#add('lilydjwg/colorizer')

" Other language Plugins
" ------------------------------------------------------------
" Golang indentation
call dein#add('fatih/vim-go')
" Yaml indentation
call dein#add('martin-svk/vim-yaml')
" Markdown syntax
call dein#add('tpope/vim-markdown')
" Git syntax
call dein#add('tpope/vim-git')
" Dockerfile
call dein#add('honza/dockerfile.vim')
" Terraform
call dein#add('hashivim/vim-terraform')

" Unite fuzzy searcher
" ------------------------------------------------------------

" Unite files, buffers, etc. sources
call dein#add('Shougo/unite.vim')
" Outline source
call dein#add('Shougo/unite-outline')
" History/yank source
call dein#add('Shougo/neoyank.vim')
" MRU source
call dein#add('Shougo/neomru.vim')
" Tag source
call dein#add('tsukkee/unite-tag')
" Ag wrapper (Unite grep alternative) search and edit
call dein#add('dyng/ctrlsf.vim')

" Interface improving
" -----------------------------------------------------------

" Nerdtree file browser
call dein#add('scrooloose/nerdtree')
" Lightline (simple status line)
call dein#add('itchyny/lightline.vim')
" Buffers tabline
call dein#add('ap/vim-buftabline')

" External tools integration plugins
" -----------------------------------------------------------

" Fugitive
call dein#add('tpope/vim-fugitive')
" Git log viewer (Gitv! for file mode)
call dein#add('gregsexton/gitv')
" Git changes showed on line numbers
call dein#add('airblade/vim-gitgutter')
" REST Console
call dein#add('diepm/vim-rest-console')

" Text insertion/manipulation
" -----------------------------------------------------------

" Highlight jump characters on f, F, t, T
call dein#add('unblevable/quick-scope')
" Surround (cs"')
call dein#add('tpope/vim-surround')
" Easy alignment
call dein#add('godlygeek/tabular')
" Safely editing in isolation
call dein#add('ferranpm/vim-isolate')
" Cycling related words via C-a C-x (i.e. true/false)
call dein#add('zef/vim-cycle')

" Colorschemes
" ---------------------------------------------------------

" Hybrid
call dein#add('w0ng/vim-hybrid')
" Jellybeans
call dein#add('nanotech/jellybeans.vim')
" Badwolf
call dein#add('sjl/badwolf')
" Molokai
call dein#add('tomasr/molokai')
" Grovbox
call dein#add('morhetz/gruvbox')
" Yowish
call dein#add('kabbamine/yowish.vim')
" Janah
call dein#add('mhinz/vim-janah')

" Other
" ---------------------------------------------------------

" Easily expand selected region
call dein#add('terryma/vim-expand-region')
" Search for highlighted word with *
call dein#add('thinca/vim-visualstar')
" Improve star by not jumping immediately
call dein#add('ironhouzi/vim-stim')
" Intelligent buffer closing
call dein#add('mhinz/vim-sayonara')
" Iabbrev auto-correction library
call dein#add('chip/vim-fat-finger')
" Matchit enhances jump motions
call dein#add('adelarsq/vim-matchit')
" More . repeat functionality
call dein#add('tpope/vim-repeat')
" Delete all but current buffer
call dein#add('vim-scripts/BufOnly.vim')
" Populate arglist with buffers in quickfix list
call dein#add('nelstrom/vim-qargs')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

" Base settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults)
" ----------------------------------------------------------

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things

" Split settings (more natural)
" ----------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current

" Timeout settings
" ----------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" Spelling settings
" ----------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)

" Search settings
" ----------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search

" Persistent undo settings
" ----------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo/
endif

" White characters settings
" ----------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪

" Filetype settings
" ----------------------------------------------------------
filetype plugin on
filetype indent on

" Omni completion settings
" ----------------------------------------------------------
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**

" Setting leader
" ----------------------------------------------------------
let g:mapleader=","

" Disabling arrow keys, space key, exmode enter
" with Q key, help with F1, etc.
" ----------------------------------------------------------
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>

" Vim defaults overriding
" ----------------------------------------------------------

" Easier window switching
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Quick replay 'q' macro
nnoremap Q @q

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Terminal mode mappings
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz

" 3.4 Common tasks
" -----------------------------------------------------

" Quick save and close buffer
nnoremap ,w :w<CR>
nnoremap <silent> ,c :Sayonara!<CR>
nnoremap <silent> ,q :Sayonara<CR>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap ,ts :ts<CR>
nnoremap ,tg :GenerateTags<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Faster sort
vnoremap ,s :!sort<CR>

" Move Around Via Methods
nmap <silent> } }zzzv
nmap <silent> { {zzzv

" Mimic Unimpaired Style For Navigating Tabs
noremap <silent>[r :bp<CR>
noremap <silent>]r :bn<CR>
noremap <silent>[R <C-O>:bfirst<CR>
noremap <silent>]R <C-O>:blast<CR>

" Mimic Unimpaired Style For Navigating Cursor History
nnoremap <silent>[i <C-O>
nnoremap <silent>]i <C-I>

" F-key actions
" -----------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
" Free
" nnoremap <silent> <F2>
" Paste mode toggling
nnoremap <silent> <F3> :set paste!<CR> :set paste?<CR>
" Toggle spelling on and off
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New horizontal term buffer
nnoremap <silent> <F8> :T ls<CR>
" Fire REST Request
nnoremap <silent> <F9> :call VrcQuery()<CR>
" Free
" nnoremap <silent> <F10>
" Howdoi integration (pip install howdoi)
nnoremap <silent> <F11> :call utils#howDoI()<CR>
" Echo out toggles legend on <F12>
nnoremap <F12> :call utils#showToggles()<CR>

" Window / Buffer management
" -----------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" Command abbreviations and mappings
" -----------------------------------------------------

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" Custom commands and functions
" -----------------------------------------------------

" Generate tags definitions
command! GenerateTags :call utils#generateCtags()

" Open notes
command! Notes :call utils#openNotes()

" Run current file
command! Run :call utils#runCurrentFile()
nnoremap <silent> ,r :Run<CR>

" Reformat whole or selection from file
command! Format :call utils#formatFile()
nnoremap <silent> ,f :Format<CR>

" Annotate file (show values in special # => comments)
command! Annotate :call utils#annotateFile()
nnoremap <silent> ,a :Annotate<CR>

" Profile
command! Profile :call utils#profile()

" Retab
command! Retab :call utils#retabToFourSpaces()

" Plugins settings
" -----------------------------------------------------

" Unite
" -----------------------------------------------------

" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Use ag if available
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C0'
  let g:unite_source_grep_recursive_opt=''

  " Set rec source command
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

" Custom profile
call unite#custom#profile('default', 'context', {
      \   'prompt': '» ',
      \   'winheight': 15,
      \ })

" Add syntax highlighting
let g:unite_source_line_enable_highlight=1

" Dont override status line
let g:unite_force_overwrite_statusline=0

" Custom unite menus
let g:unite_source_menu_menus = {}

" Utils menu
let g:unite_source_menu_menus.utils = {
      \     'description' : 'Utility commands',
      \ }
let g:unite_source_menu_menus.utils.command_candidates = [
      \       ['Run XMPFilter', 'Annotate'],
      \       ['Format file', 'Format'],
      \       ['Run file', 'Run'],
      \       ['Generate Ctags', 'GenerateTags'],
      \       ['Show notes', 'Notes'],
      \     ]

" Git menu
let g:unite_source_menu_menus.git = {
      \     'description' : 'Git commands',
      \ }
let g:unite_source_menu_menus.git.command_candidates = [
      \       ['Stage hunk', 'GitGutterStageHunk'],
      \       ['Unstage hunk', 'GitGutterRevertHunk'],
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit --verbose'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
      \       ['Visual log', 'Gitv'],
      \       ['Current file visual log', 'Gitv!'],
      \     ]

" My unite menu
let g:unite_source_menu_menus.unite = {
      \     'description' : 'My Unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = [
      \       ['Unite MRUs', 'call utils#uniteMRUs()'],
      \       ['Unite buffers', 'call utils#uniteBuffers()'],
      \       ['Unite file browse', 'call utils#uniteFileBrowse()'],
      \       ['Unite file search', 'call utils#uniteFileRec()'],
      \       ['Unite history', 'call utils#uniteHistory()'],
      \       ['Unite line search', 'call utils#uniteLineSearch()'],
      \       ['Unite menu', 'call utils#uniteCustomMenu()'],
      \       ['Unite registers', 'call utils#uniteRegisters()'],
      \       ['Unite snippets', 'call utils#uniteSnippets()'],
      \       ['Unite sources', 'call utils#uniteSources()'],
      \       ['Unite file tags (symbols)', 'call utils#uniteOutline()'],
      \       ['Unite tags', 'call utils#uniteTags()'],
      \       ['Unite windows', 'call utils#uniteWindows()'],
      \       ['Unite yank history', 'call utils#uniteYankHistory()'],
      \       ['Unite jump history', 'call utils#uniteJumps()'],
      \     ]

" Tag source settings
let g:unite_source_tag_max_name_length=40
let g:unite_source_tag_max_fname_length=50

" NERDTree
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" Gitgutter settings
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'

" Vim JSX highlighting settings
" -----------------------------------------------------
let g:jsx_ext_required=0

" SimpylFold settings
" -----------------------------------------------------
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Lightline settings
" -----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'filetype': 'utils#lightLineFiletype',
      \   'fileformat': 'utils#lightLineFileformat',
      \   'fileencoding': 'utils#lightLineFileencoding'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Neomake settings
" -----------------------------------------------------
let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }

" Vim Markdown settings
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages=[
      \'bash=sh',
      \'git=gitconfig',
      \'javascript',
      \'python',
      \'viml=vim',
      \'xdefaults',
      \'zsh']

" Vim REST console settings
" -----------------------------------------------------
let g:vrc_set_default_mapping=0
let g:vrc_output_buffer_name='__RESPONSE__.rest'

" Quick scope settings
" -----------------------------------------------------
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

" Deoplete autocomplete settings
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#auto_complete_start_length=5
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'member', 'file']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni']
let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni']

" Ctrl-SF settings
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=1
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=1

" Javascript libraries syntax settings
" -----------------------------------------------------
let g:used_javascript_libs = 'chai,flux,react,underscore'

" Colorizer settings
" -----------------------------------------------------
let g:colorizer_nomap=1

" Plugin Mappings
" -----------------------------------------------------

" Unite and extensions
" -----------------------------------------------------

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <silent> <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-k> <Plug>(unite_select_previous_line)
  " Runs 'splits' action by <C-s> and <C-v>
  imap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " Exit with escape
  nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
  " Mark candidates
  vmap <silent> <buffer> m <Plug>(unite_toggle_mark_selected_candidates)
  nmap <silent> <buffer> m <Plug>(unite_toggle_mark_current_candidate)
endfunction

" Search files recursively ([o]pen file)
nnoremap <silent> <leader>o :call utils#uniteFileRec()<CR>
" Browse [f]iles in CWD
nnoremap <silent> <leader>f :call utils#uniteFileBrowse()<CR>
" [U]nite sources
nnoremap <silent> <leader>u :call utils#uniteSources()<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :call utils#uniteBuffers()<CR>
" Search in current file ou[t]line (tags in current file)
nnoremap <silent> <leader>t :call utils#uniteTags()<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :call utils#uniteLineSearch()<CR>
" Search in [y]ank history
nnoremap <silent> <leader>y :call utils#uniteYankHistory()<CR>
" Search in [r]egisters
nnoremap <silent> <leader>r :call utils#uniteRegisters()<CR>
" Search in opened [w]indow splits
nnoremap <silent> <leader>w :call utils#uniteWindows()<CR>
" Search in latest [j]ump positions
nnoremap <silent> <leader>j :call utils#uniteJumps()<CR>
" Search in my custom unite [m]enu with my commands
nnoremap <silent> <leader>m :call utils#uniteCustomMenu()<CR>
" Seach in help menu for commands
nnoremap <silent> <leader>hc :call utils#uniteCommands()<CR>
" Seach in help menu for mappings
nnoremap <silent> <leader>hm :call utils#uniteMappings()<CR>

" Isolate
" -----------------------------------------------------
vnoremap ,i :Isolate<CR>
nnoremap ,u :UnIsolate<CR>

" Gitgutter
" -----------------------------------------------------
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>

" Expand region
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Vim Markdown
" -----------------------------------------------------
nmap [[ <Plug>Markdown_MoveToPreviousHeader
nmap ]] <Plug>Markdown_MoveToNextHeader

" Argumentative (use a instead of ,)
" -----------------------------------------------------
xmap ia <Plug>Argumentative_InnerTextObject
xmap aa <Plug>Argumentative_OuterTextObject
omap ia <Plug>Argumentative_OpPendingInnerTextObject
omap aa <Plug>Argumentative_OpPendingOuterTextObject
nmap [a <Plug>Argumentative_Prev
nmap ]a <Plug>Argumentative_Next
xmap [a <Plug>Argumentative_XPrev
xmap ]a <Plug>Argumentative_XNext
nmap <a <Plug>Argumentative_MoveLeft
nmap >a <Plug>Argumentative_MoveRight

" Deoplete autocomplete
" -----------------------------------------------------
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" CtrlSF
" -----------------------------------------------------
nnoremap <leader>gg :CtrlSF<Space>
nnoremap <leader>gG :CtrlSFToggle<Space>

let g:ctrlsf_mapping = {
      \ "next"    : "n",
      \ "prev"    : "N",
      \ "quit"    : "q",
      \ "openb"   : "",
      \ "split"   : "s",
      \ "tab"     : "",
      \ "tabb"    : "",
      \ "popen"   : "",
      \ "pquit"   : "",
      \ "loclist" : "",
      \ }

nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>

" Fugitive
" -----------------------------------------------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit --verbose<CR>
nnoremap <leader>gc :Gcommit --verbose<CR>
nnoremap <leader>gd :Gvdiff<CR>

" BufOnly
" -----------------------------------------------------
nnoremap ,C :Bonly<CR>

" Gitv
" -----------------------------------------------------
nnoremap <leader>gh :Gitv!<CR>

" Color and highlighting settings
" --------------------------------------------------
" Syntax highlighting
syntax on

" Default to Dark background
set background=dark

" Color scheme based on time
if strftime("%H") < 15
  colorscheme janah
else
  let g:rehash256=1
  colorscheme janah
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Listchars highlighting
highlight NonText ctermfg=235 guifg=gray
highlight SpecialKey ctermfg=235 guifg=gray

" Remove underline in folded lines
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment

" Autocommands
" -----------------------------------------------------

" Keywordprg settings
autocmd FileType vim setlocal keywordprg=:help

" Turn spellcheck on for markdown files
autocmd BufNewFile,BufRead *.md setlocal spell

" Remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Set Autocompleter for python
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete



" Run linters after save
" -----------------------------------------------------

" npm install -g eslint
autocmd BufWritePost *.js Neomake eslint
" npm install -g jsonlint
autocmd BufWritePost *.json Neomake jsonlint
" npm install -g typescript
autocmd BufWritePost *.ts Neomake tsc
" gem install rubocop
autocmd BufWritePost *.rb Neomake rubocop
" sudo apt-get install elixir
autocmd BufWritePost *.ex Neomake elixir
" apt-get install tidy
autocmd BufWritePost *.html Neomake tidy
" gem install haml_lint
autocmd BufWritePost *.haml Neomake hamllint
" gem install scsslint
autocmd BufWritePost *.scss Neomake scsslint
" gem install mdl
autocmd BufWritePost *.md Neomake mdl
" apt-get install shellcheck
autocmd BufWritePost *.sh Neomake shellcheck
