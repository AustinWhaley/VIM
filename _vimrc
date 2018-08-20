set nocompatible	    " Require for Vim coolness
set nobk			    " Don't create backup files before writing
set si				    " Turn on smart indent
set ai                  " Turn on auto indentation
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
set so=10               " When 10 lines from top or bottom move screen too
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
    set guioptions=icpM
    if has('win32') || has('win64')
        if (v:version == 704 && has("patch393")) || v:version > 704
            set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,
                        \geom:1,renmode:5,taamode:1
        endif
    endif
    if has("gui_gtk2")
        set guifont=Anonymice\ Powerline\ Bold:h10
    elseif has("gui_win32")
        set guifont=Monoid:h8
    endif
endif

" Setting leader character to forward slash explictly
let mapleader = '\'

" Enable code folding by indent for python and disable folding by default
setlocal foldmethod=indent
setlocal nofoldenable
" Press space in normal mode to toggle
nnoremap <silent> <Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>
vnoremap <Space> zf
" Custom command to update the header for a python file every save
nmap <S-w> gg2jddO<Esc>i#    Last Change:<Space><F3><CR><Esc>
" Ignore F1, page-up, and page-down because the keys are ANNOYING
inoremap <PageUp>   <NOP>
noremap  <PageUp>   <NOP>
inoremap <PageDown> <NOP>
noremap  <PageDown> <NOP>
inoremap <F1>       <NOP>
noremap  <F1>       <NOP>
" Press F3 to write current time and date under cursor
imap <F3> <C-R>=strftime('%c')<CR>
" Press shift tab to tab back with spaces and let tab work in normal mode
nmap <Tab> I<Space><Space><Space><Space><Esc>l
imap <S-Tab> <Esc>^4X
nmap <S-Tab> <Esc>^4X
" Control-s also will save the file and update the python header
nmap <C-s> zRgg2jddOLast Change:<Space><C-R>=strftime('%c')<CR><Esc>:w<CR>
" Press Ctl-Tab to move through buffers in any mode
imap <C-Tab> <Esc>:w<CR>:bn<CR>
vmap <C-Tab> <Esc>:w<CR>:bn<CR>
nmap <C-Tab> :w<CR>:bn<CR>
" Press Ctl-F to find the function definition in python
nmap <C-F> yw:exe '/def ' . @0 . '('<CR>

" Press F8 to activate spell checking, F9 to turn it off.
map <F8> <Esc>:setlocal spell spelllang=en_us<CR>
map <F9> <Esc>:setlocal nospell<CR>
" Moving between split panes with CTL-Direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Remapping the NERDCommenter toggle comment on Ctl-Space
nmap <C-Space> <Leader>c<Space>
vmap <C-Space> <C-0><Leader>c<Space><Esc>v

" Plugins
filetype plugin indent on
filetype plugin on

" Install Plugins - To update use the command :PlugInstall!
call plug#begin('~/vimfiles/plugged')
    Plug 'vim-airline/vim-airline-themes'
    Plug 'powerline/powerline-fonts'
    Plug 'nelstrom/vim-markdown-folding'
    Plug 'tpope/vim-markdown'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'nvie/vim-flake8'
    Plug 'townk/vim-autoclose'
    Plug 'tpope/vim-capslock'
    Plug 'suxpert/vimcaps'
    Plug 'scrooloose/nerdcommenter'
call plug#end()

" Enable Markdown folding
set foldenable

" Make airline appear all the time
set laststatus=2

" Set system clipboard
set clipboard=unnamed

" AIRLINE MODS
" Show word count
let g:airline#extensions#wordcount#enabled = 1
" Force Airline to refresh after setup so settings work
:autocmd!
:autocmd VimEnter * :AirlineRefresh
set encoding=utf-8
let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = '¦¦¦¦¦'
let g:airline#extensions#tabline#enabled = 1
" Show the buffer number
let g:airline#extensions#tabline#buffer_idx_mode = 1
" Show only filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Set the theme of airline
let g:airline_theme='ubaryd'
" Remove the percent part of the status line
let g:airline_section_z = airline#section#create(['linenr', ':%3v'])

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
" Show capslock status in the statusline
let g:airline#extensions#capslock#enabled = 1


syntax on	    		" Turn on syntax highlighting
colorscheme desert      " Set colorscheme

" Flagging Unnecessary Whitespace
" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
:au BufRead,BufNewFile *.py,*.pyw,*.c,*.h silent
match BadWhitespace /\s\+$/

" Custom command to open the vimrc in a new buf and move to it
command! EditVim badd $HOME/_vimrc <Bar> bn
" Custom command to source your vimrc
command! SrcVim source $HOME/_vimrc
" Custom command to save the header for python file even if the caps lock is on
command! W w
command! Q q

" Spooky Scary Skeleton files for extensions
au BufNewFile *.py 0r ~/vimfiles/skeletons/skeleton.py | let IndentStyle = "py"

" Nerd Commenter Stuff
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
