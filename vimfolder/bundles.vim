filetype off

set runtimepath+=~/.vim/bundle/vundle

call vundle#rc()

Bundle "git://github.com/gmarik/vundle"

" System:
  Bundle "git://github.com/clones/vim-l9.git"

 " Ultimate auto-completion system for Vim
  Bundle "git://github.com/ervandew/supertab.git"

 " Toggle showing/hiding both the quickfix list and the location list
  Bundle "git://github.com/milkypostman/vim-togglelist.git"

 " A set of Vim Script utilities (Required for quickfix signs)
  Bundle "git://github.com/tomtom/tlib_vim.git"

 " Show marks in the gutter for various items (marks, quickfix, location, errors)
  Bundle "git://github.com/tomtom/quickfixsigns_vim.git"

 " Pairs of Mappings in Vim
  Bundle "git://github.com/tpope/vim-unimpaired.git"

 " Adds status bar to Vim
  Bundle "git@github.com:bling/vim-airline.git"

" Working With Colors:
 " Show color previews and help pick the one you want
  Bundle "git://github.com/Rykka/colorv.vim.git"

" Tagging:
 " Updates entries in a tags file automatically when saving
  Bundle "git://github.com/jfelchner/AutoTag.git"

 " Vim plugin that displays tags in a window, ordered by class etc
  Bundle "git://github.com/majutsushi/tagbar.git"

" File Navigation:
 " A tree explorer plugin for vim
  Bundle "git://github.com/scrooloose/nerdtree.git"

  " Fuzzy file, buffer, mru and tag finder
  Bundle "git://github.com/kien/ctrlp.vim.git"

  " Vim plugin for the Perl module / CLI script 'ack'
  Bundle "git://github.com/mileszs/ack.vim.git"

" File Manipulation:
 " Graph your Vim undo tree in style.
  Bundle "git://github.com/sjl/gundo.vim.git"

 " Support for user-defined text objects
  Bundle "git://github.com/kana/vim-textobj-user.git"

 " Support text objects bound to indention level
  Bundle "git://github.com/austintaylor/vim-indentobject.git"

 " Vim script for text filtering and alignment
  Bundle "git://github.com/godlygeek/tabular.git"

 " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
  Bundle "git://github.com/Townk/vim-autoclose.git"

 " quoting/parenthesizing made simple
  Bundle "git://github.com/tpope/vim-surround.git"

" Git:
 " webapi access for vim
  Bundle "https://github.com/mattn/webapi-vim.git"

 " vimscript for gist
  Bundle "git://github.com/mattn/gist-vim.git"

 " a Git wrapper so awesome, it should be illegal
  Bundle "git://github.com/tpope/vim-fugitive.git"

 " gitk for Vim
  Bundle "git://github.com/jfelchner/gitv.git"

" Programming:
 " General:
  " Syntax checking hacks for vim
    Bundle "git://github.com/scrooloose/syntastic.git"

  " Color coding of pairs of parenthesis, braces and brackets
    Bundle "git://github.com/kien/rainbow_parentheses.vim.git"

  " Comment Toggling
    Bundle "git@github.com:scrooloose/nerdcommenter.git"

 " Python:
  " Auto completion etc
    "Bundle "git@github.com:davidhalter/jedi-vim.git"

 " Markdown:
  " Vim Markdown runtime files
    Bundle "git://github.com/tpope/vim-markdown.git"

 " Javascript:
  " JSHint fork of jslint.vim
    Bundle "https://github.com/Shutnik/jshint2.vim"

  " Vastly improved vim's javascript indentation.
    Bundle "git://github.com/pangloss/vim-javascript.git"

  " CoffeeScript support for vim
    Bundle "git://github.com/kchmck/vim-coffee-script.git"

  " JSON Highlighting for Vim
    Bundle "git://github.com/leshill/vim-json.git"

 " HTML And XML:
  " zen-coding for vim
    Bundle "git://github.com/mattn/zencoding-vim.git"

  " MatchParen for HTML tags
    Bundle "git://github.com/gregsexton/MatchTag.git"

  " Provides sgml (xml, html, etc.) end tag completion
    Bundle "git://github.com/ervandew/sgmlendtag.git"

 " Templating:
  " Vim plugin for Handlebars
    Bundle "git://github.com/nono/vim-handlebars.git"

 " CSS:
  " Vim runtime files for Haml, Sass, and SCSS
    Bundle "git://github.com/tpope/vim-haml.git"

  " Add extra syntax highlighting for SCSS files
    Bundle "git://github.com/cakebaker/scss-syntax.vim.git"

 " Nginx:
  " Syntax highlighting for nginx configuration files
    Bundle "git://github.com/mutewinter/nginx.vim.git"

 " Tmux:
  " Syntax highlighting for tmux configuration files
    Bundle "git://github.com/acustodioo/vim-tmux.git"

 " Puppet:
  " Editor support for Puppet files
    Bundle "git://github.com/jfelchner/vim-puppet.git"

" Themes And Appearance:
 " Colorsheme Scroller, Chooser, and Browser
  Bundle "git://github.com/vim-scripts/ScrollColors.git"

 " A colorful, dark color scheme for Vim.
  Bundle "git://github.com/nanotech/jellybeans.vim.git"

 " A Vim color scheme with dark and light variants
  Bundle "git://github.com/noahfrederick/Hemisu.git"

 " Precision colorscheme for the vim text editor
  Bundle "git://github.com/altercation/vim-colors-solarized.git"

 " More colorschemes
  Bundle "git://github.com/daylerees/colour-schemes", { "rtp": "vim-themes/" }
