set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'
"Tell you if your syntax is garbage
Plugin 'vim-syntastic/syntastic'
" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
" autocomplete thats not bad
Plugin 'Valloric/YouCompleteMe'
" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
" Seabird Vim Color plugin
Plugin 'nightsense/seabird'
" airline plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" autoPairs
Plugin 'auto-pairs-gentle'
" to show tablines
Plugin 'https://github.com/Yggdroot/indentLine'
"ultisnips
Plugin 'SirVer/ultisnips'
"the snippets for it
Plugin 'honza/vim-snippets'
"SuperTab lets ultisnips and YCM play nice and gently
Plugin 'ervandew/supertab'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" Now we can turn our filetype functionality back on
filetype plugin indent on

" GENERAL OPTIONS
behave xterm
set viminfo='20,\"500,%	" ' Maximum number of previously edited files for which
"   the marks are remembered.  
" " Maximum number of lines saved for each register.
" % When included, save and restore the buffer list.
"   If Vim is started with a file name argument, the
"   buffer list is not restored.  If Vim is started
"   without a file name argument, the buffer list is
"   restored from the viminfo file.  Buffers without a
"   file name and buffers for help files are not written
"   to the viminfo file.
set history=500		" keep {number} lines of command line history

" TAB HANDLING, program formatting:
set tabstop=8		" ts, number of spaces that a tab *in an input file* is
"   equivalent to.
set shiftwidth=3	" sw, number of spaces shifted left and right when
"   issuing << and >>
"  commands
set smarttab            " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=3       " number of spaces that a tab *pressed by the user*
"   is equivalent to
set shiftround          " round to 'shiftwidth' for "<<" and ">>"
set expandtab           " don't input tabs; replace with spaces. <local to
"   buffer>
" setting numbered lines
set number
" show whitespace
set list
" see Vim book p 71 for this
filetype on
au BufRead,BufNewFile *.py set expandtab
autocmd FileType * set formatoptions=tcql nocindent comments&
" Formatoptions: 'q' allows formatting with "gq".  'r' automates the middle of
"    a comment.  'o' automates comment formatting with the 'o' or 'O'
"    commands.  'c' wrap comments.  'l' do not break lines in insert mode.
set autoindent          " automatically set the indent of a new line (local to
"   buffer)
set smartindent         " autoindenting (local to buffer); let cindent

set wrap                " whether to wrap lines
" Make breaks more obvious
"set showbreak=+++\ \  

" No more than 80 char per line dood
set colorcolumn=80,85,90

set nocompatible
set incsearch
set showmatch
set backspace=indent,eol,start

 syntax on               " colorize
 set statusline=%f%m%r%h%w\ %R%M\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
 set laststatus=2 " always show the status line

" Airline
set laststatus=2  
set t_Co=256  
set noshowmode  

" Solarized
syntax enable
set background=dark
colorscheme petrel

" For fonts
" air-line
let g:airline_powerline_fonts = 1
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"New fonts
let g:Powerline_symbols = 'fancy'
set guifont=Liberation\ Mono\ for\ Powerline\ 10 

"AutoPairs to be made gentle
let g:AutoPairsUseInsertedCount = 1
"making YCM use Python 2 to avoid the SHUT DOWN error
let g:ycm_server_python_interpreter = 'python3'
"indentLine color brightwhite
let g:indentLine_char = '|'
let g:indentLine_color_term = 269
" Syntastic reccomended setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" black magic to compile on F9
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%,1)<cr>
