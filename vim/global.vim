" General Settings:
scriptencoding utf-8                      " UTF8 All day, every day
set encoding=utf-8                        " UTF8 All day, every day
set directory=/tmp/                       " Set temporary directory (don't litter local dir with swp/tmp files)
set timeout timeoutlen=300                " Do not wait so long for extra keystrokes
set history=1000                          " Remeber the last 1000 Ex commands
set lazyredraw
set ttyfast                               " Send more characters when redrawing the screen
set backspace=indent,eol,start            " Allow backspace to go beyond insert start


set keywordprg=:help                      " Set it to internal VIM Help

" Undo:
if v:version >= 703
  set undofile
  let &undodir=&directory

  set undolevels=2000                     " Increase Number Of Undo Levels:
endif

" VimInfo:
set viminfo+=/50                          " Save Previous Search Patterns After Exit:
set viminfo+=:50                          " Save Previous Command Line Patterns After Exit:
set viminfo+=f900                         " Save Previous File Marks After Exit:
set viminfo+=<1000                        " Remember More Register Lines:

syntax on                                 " Enable Filetype Specific Syntax
filetype plugin on                        " Enable Filetype Specific Plugins

" Security:
set modelines=0                           " Disable modelines

" Indenting:
filetype indent on                        " Enable Filetype Specific Indenting
set autoindent                            " Turn On Autoindent
set smartindent                           " And Use Smartindent Instead

" VimTurds:
set nobackup                              " Do not create backup files when saving over existing files
set nowritebackup                         " A little paranoid, but disable the writebackup function as well
set noswapfile                            " No swap files when editing please

" Look And Feel:
set t_Co=256                              " Tell The Term To Use 256 Colors
set visualbell                            " Use Screen Flash Instead Of Beep
set errorbells                            " Flash Screen For Errors
set background=dark                       " The power of the Dark Side
colorscheme solarized                     " Default Color Scheme
set linespace=3                           " A Little Extra Height For Lines:

set showbreak=↪                           " Make Line Wraps More Noticeable:

set listchars=precedes:❮                  " Show When Lines Extend Off The Right Of The Screen
set listchars+=extends:❯                  " Show When Lines Extend Off The Left Of The Screen
set listchars+=tab:▸\                     " Show Tab Characters
set listchars+=trail:·                    " Show Trailing Whitespace
set list

" Registers:
set clipboard=unnamed                     " Yank And Paste To The System Clipboard By Default

" Formatting:
set formatoptions=c                       " Format comments
set formatoptions+=r                      " Continue comments by default
set formatoptions+=l                      " Don't break lines that are already long
set formatoptions+=o                      " Make comment when using o or O from comment line
set formatoptions+=q                      " Format comments with gq
set formatoptions+=n                      " Recognize numbered lists
set formatoptions+=2                      " Use indent from 2nd line of a paragraph
set formatoptions+=1                      " Break before 1-letter words
set textwidth=80                          " Set Where Text Should Auto-Wrap

" Folding:
"set foldmethod=indent                     " Fold based on indenting by default
"set foldlevelstart=99                     " Don't autofold anything (but still able to fold manually)
"set foldlevel=100                         " Don't autofold anything (but still able to fold manually)

" Mouse:
"set nomousefocus                          " Don't focus the window when the mouse pointer is moved.
"set mousehide                             " Hide mouse pointer on insert mode.
"set mouse=a                               " Enable the mouse in all modes
"set ttymouse=xterm2                       " Enable mouse handling in xterm2 terminals

" Wrapping:
set whichwrap-=h,l                        " Do Not Wrap To Next Line With The H And L Keys
set nowrap                                " Disable Line Wrapping

" Joining
set nojoinspaces                          " Only insert single space after a '.', '?' and '!' with a join command.

" Tabs:
set expandtab                             " Use Indents Of Two Spaces And Have Them Copied Down Lines:
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround                            " Round indent by a multiple of shiftwidth in indent mode
set cpoptions+=I                          " Do Not Remove Empty Tabs:

" Line Numbers:
set number                                " Enable line numbers
set relativenumber                        " Set relative line numbering
set numberwidth=4                         " Set line number column width

" Window And Buffer Management:
set splitbelow                            " Open new horizontal split windows below current
set splitright                            " Open new vertical split windows to the right
set autoread                              " Set to auto read when a file is changed from the outside
set autowrite                             " Write Files On Buffer Change
set hidden                                " Allow Unfocusing Of A Buffer With Changes

" Completion Configuration:
set completeopt=menu                      " Show a Menu Except When Only 1 Match
set completeopt+=preview                  " Show a Extra Information In Completion Menu

" Wild Menu Mode Config:
set wildmenu                              " Enable the wild menu
set wildmode=list:longest,full            " Better completion

set wildignore=.hg                        " Ignore VCS files
set wildignore+=.svn
set wildignore+=CVS
set wildignore+=.git
set wildignore+=*.gem                     " Ignore compiled files
set wildignore+=*.rbc
set wildignore+=*.rbo
set wildignore+=*.o
set wildignore+=*.a
set wildignore+=*.so
set wildignore+=*.out
set wildignore+=*.obj
set wildignore+=*.class
set wildignore+=*.jpg                     " Ignore images
set wildignore+=*.png
set wildignore+=*.gif
set wildignore+=*.zip                     " Ignore Archive Files
set wildignore+=*.rar
set wildignore+=*.gz
set wildignore+=*.bz2
set wildignore+=*.xz
set wildignore+=*.pdf                     " Ignore PDF files
set wildignore+=*/tmp/*                   " Ignore any temp directories
set wildignore+=*/log/*                   " Ignore any log directories
set wildignore+=*/solr/data/*             " Ignore Solr cache files
set wildignore+=*/node_modules/*          " Ignore Node module cache files
set wildignore+=*.pyc                     " Ignore compiled Python files
set wildignore+=*.pyo
set wildignore+=*.fam                     " Ignore compiled Falcon files
set wildignore+=*/vendor/gems/*           " Ignore Bundler Cache
set wildignore+=*/vendor/cache/*
set wildignore+=*/.bundle/*
set wildignore+=*/.sass-cache/*           " Ignore Sass Cache
set wildignore+=*/*.docset/*              " Ignore Objective-C docset directories
set wildignore+=*/public/system/*         " Ignore Capistrano system directory
set wildignore+=*.swp,*~,._*              " Disable temp and swap files
set wildignore+=.DS_Store                 " Ignore all .DS_Store files

" StatusBar:
set laststatus=2                          " Always show status bar
set shortmess+=a                          " Enable All Short Abbreviations For Status Bar Items
set noshowmode                            " We're using powerline so we don't need to see the mode in the second line

" Search:
set smartcase                             " Do Not Ignore Case If Search Term Contains Uppercase Characters
set ignorecase                            " Ignore Case Of Search Items
set hlsearch                              " Highlight Search Terms:
set incsearch                             " Show the `best match so far' as search strings are typed
set wrapscan                              " Searches wrap around the end of the file
set gdefault                              " Assume the /g flag on :s substitutions to replace all matches in a line

" Matching:
set noshowmatch                           " Do Not Jump To Matching Pair

" Visual Mode:
set virtualedit=block                     " Make Visual Block Mode Select Blocks:
set virtualedit+=onemore                  " Allow The Cursor One Character Past The End Of Line

" Tags:
set notagbsearch                          " Perform binary tag search (vs linear) in case tags aren't sorted to avoid missing tags
set showfulltag                           " Show extra information when using tags in insert mode

" Windows And Cursors:
set guicursor=n-v-c:hor20-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor,a:blinkwait175-blinkoff150-blinkon175  " Show Some Cursor Love
set helpheight=10
set scrolloff=3                           " Give the cursor some space
set sidescrolloff=4                       " Give the cursor some space
set nostartofline                         " Keep Cursor In Same Column When Scrolling If Possible
set cpoptions+=qI                         " Do Not Move Cursor When Joining Multiple Lines

highlight ColorColumn ctermbg=magenta     " Set your highlight color
call matchadd('ColorColumn', '\%81v', 100)" Hightlight column 81 on each line if a char is there
