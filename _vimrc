set nocompatible	    " Require for Vim coolness
set nobk			    " Don't create backup files before writing
set ai				    " Turn on auto indentation
set si				    " Turn on smart indent
set ru				    " Turn on the ruler
set sc				    " Show commands
set smarttab		    " Turn on smart tabs
set expandtab		    " Exapnd tabs to spaces
set tabstop=4			" TAB becomes X spaces
set softtabstop=4		" TAB becomes X spaces in Vim operations
set shiftwidth=4		" Number of spaces for indentation
set bsdir=last			" When browsing files, go to the last folder
set hlsearch			" Highlight search results
set incsearch			" Turn on incremental searching
set history=100			" Keep X number of commands in history
set number			    " Turn on line numbers
set t_Co=256			" Enable 256 colors
set rnu                 " Set relative line numbers

" Allow backspace in insert mode
set backspace=indent,eol,start	" Allow backspace in insert mode

" move backups and swap files to Temp folder
set backup
set backupdir=C:\Users\Austin_Whaley\AppData\Local\Temp
set dir=C:\Users\Austin_Whaley\AppData\Local\Temp

" Don't wake up system with blinking cursor
let &guicursor = &guicursor . ",a:blinkon0"

" If gvim is running, set a font, otherwise don't
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Anonymice\ Powerline\ Bold:h10
  elseif has("gui_win32")
    set guifont=Monoid:h8
  endif
endif


" Enable code folding by indent for python and disable folding by default
setlocal foldmethod=indent
setlocal nofoldenable
" Press space in normal mode to toggle
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Press F7 to activate spell checking, F8 to turn it off.
map <F7> <Esc>:setlocal spell spelllang=en_us<CR>
map <F8> <Esc>:setlocal nospell<CR>

" Plugins
filetype plugin indent on

" Install Plugins - To update use the command :PlugInstall!
call plug#begin('~/vimfiles/plugged')
    Plug 'vim-airline/vim-airline-themes'
    Plug 'powerline/powerline-fonts'
    Plug 'nelstrom/vim-markdown-folding'
    Plug 'tpope/vim-markdown'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'w0rp/ale'
    Plug 'nvie/vim-flake8'
    Plug 'townk/vim-autoclose'
call plug#end()

" Enable Markdown folding
set foldenable

" Make airline appear all the time
set laststatus=2

" Set system clipboard
set clipboard=unnamed

" Show word count
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Force Airline to refresh after setup so settings work
:autocmd!
:autocmd VimEnter * :AirlineRefresh

set encoding=utf-8
let g:airline_powerline_fonts = 1

syntax on	    		" Turn on syntax highlighting
colorscheme desert      " Set colorscheme

" Flagging Unnecessary Whitespace
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
:au BufRead,BufNewFile *.py,*.pyw,*.c,*.h silent
match BadWhitespace /\s\+$/

" ALE settings
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'python': ['flake8','pylint']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" Keep function folds persistent in files
:autocmd BufWinLeave *.* mkview
:autocmd BufWinEnter *.* silent loadview
