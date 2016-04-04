set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" System:
Plugin 'clones/vim-l9.git'

" Ultimate auto-completion system for Vim
Plugin 'ervandew/supertab.git'

" Toggle showing/hiding both the quickfix list and the location list
Plugin 'milkypostman/vim-togglelist.git'

" A set of Vim Script utilities (Required for quickfix signs)
Plugin 'tomtom/tlib_vim.git'

" Show marks in the gutter for various items (marks, quickfix, location, errors)
Plugin 'tomtom/quickfixsigns_vim.git'

" Pairs of Mappings in Vim
Plugin 'tpope/vim-unimpaired.git'

" Adds status bar to Vim
Plugin 'bling/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'

" Tagging:

" Vim plugin that displays tags in a window, ordered by class etc
Plugin 'majutsushi/tagbar.git'

" File Navigation:
" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree.git'

" Fuzzy file, buffer, mru and tag finder
Plugin 'kien/ctrlp.vim.git'

" Vim plugin for the Perl module / CLI script 'ack'
Plugin 'mileszs/ack.vim.git'

" File Manipulation:
" Graph your Vim undo tree in style.
Plugin 'sjl/gundo.vim.git'

" Support for user-defined text objects
Plugin 'kana/vim-textobj-user.git'

" Support text objects bound to indention level
Plugin 'austintaylor/vim-indentobject.git'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular.git'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Townk/vim-autoclose.git'

" quoting/parenthesizing made simple
Plugin 'tpope/vim-surround.git'

" Git:
" webapi access for vim
Plugin 'mattn/webapi-vim.git'

" vimscript for gist
Plugin 'mattn/gist-vim.git'

" a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive.git'

" Programming:
" General:
" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic.git'

" Color coding of pairs of parenthesis, braces and brackets
Plugin 'kien/rainbow_parentheses.vim.git'

" Comment Toggling
Plugin 'scrooloose/nerdcommenter.git'

" Python:
" Python Mode
"Plugin 'klen/python-mode'

" Python indentation
Plugin 'hynek/vim-python-pep8-indent'

" PyTest Support
Plugin 'alfredodeza/pytest.vim.git'

" JEDI support
Plugin 'davidhalter/jedi-vim.git'

" Better folding support
Plugin 'tmhedberg/SimpylFold'

" Flake8 Checking
Plugin 'nvie/vim-flake8'

" Markdown:
" Vim Markdown runtime files
Plugin 'tpope/vim-markdown.git'

" Javascript:
" JSHint fork of jslint.vim
Plugin 'Shutnik/jshint2.vim'

" Node Support
Plugin 'moll/vim-node.git'

" Vastly improved vim's javascript indentation.
Plugin 'jelera/vim-javascript-syntax.git'

" CoffeeScript support for vim
Plugin 'kchmck/vim-coffee-script.git'

" Mustache support for vim
Plugin 'mustache/vim-mode.git'

" JSON Highlighting for Vim
Plugin 'leshill/vim-json.git'

" HTML And XML:
" zen-coding (emmet) for vim
Plugin 'mattn/emmet-vim.git'

" MatchParen for HTML tags
Plugin 'gregsexton/MatchTag.git'

" Provides sgml (xml, html, etc.) end tag completion
Plugin 'ervandew/sgmlendtag.git'

" Templating:
" Vim plugin for Handlebars
Plugin 'nono/vim-handlebars.git'

" CSS:
" Vim runtime files for Haml, Sass, and SCSS
Plugin 'tpope/vim-haml.git'

" Add extra syntax highlighting for SCSS files
Plugin 'cakebaker/scss-syntax.vim.git'

" Nginx:
" Syntax highlighting for nginx configuration files
Plugin 'mutewinter/nginx.vim.git'

" Tmux:
" Syntax highlighting for tmux configuration files
Plugin 'acustodioo/vim-tmux.git'

" Scala:
" Syntax highlighting for Scala files
Plugin 'derekwyatt/vim-scala.git'

" Elixir:
" Syntax highlighting for Elixir riles
Plugin 'elixir-lang/vim-elixir'

" Themes And Appearance:
" Colorsheme Scroller, Chooser, and Browser
Plugin 'vim-scripts/ScrollColors.git'

" A colorful, dark color scheme for Vim.
Plugin 'nanotech/jellybeans.vim.git'

" A Vim color scheme with dark and light variants
Plugin 'noahfrederick/Hemisu.git'

" Precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized.git'

" Base16 Color Scheme
Plugin 'chriskempson/base16-vim'

" More colorschemes
Plugin 'daylerees/colour-schemes'

" Papercolor theme
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()
filetype plugin indent on
