"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle call
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle required call
Plugin 'gmarik/Vundle.vim'

" => Personal plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
Plugin 'scrooloose/nerdtree'

" Vim-Airline
Plugin 'bling/vim-airline'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Tagbar
Plugin 'majutsushi/tagbar'

" Vim-surround
Plugin 'tpope/vim-surround'

" Syntastic
Plugin 'scrooloose/syntastic'

" Vim-markdown
Plugin 'tpope/vim-markdown'

" Vim-markdown-folding
Plugin 'nelstrom/vim-markdown-folding'

" MRU (Most Recently Used)
Plugin 'yegappan/mru'

" JSON syntax-highlight
Plugin 'elzr/vim-json'

" Peaksea colorscheme
Plugin 'vim-scripts/peaksea'

" ACK
Plugin 'mileszs/ack.vim'

" FuGITive
Plugin 'tpope/vim-fugitive'

" AutoClose
Plugin 'Townk/vim-autoclose'

call vundle#end()            " required
filetype plugin indent on    " required


" => How to use Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Installing plugins (requires restarting vim/re-sourcing .vimrc)
" :PluginInstall

" Updating plugins
" :PluginInstall!
" or
" :PluginUpdate

" Removing plugins
" :PluginClean



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set , as leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

" Enable mouse
set mouse=a

" Hide mouse when typing
set mousehide

" Enable backspace behaviour
set bs=2

" Enable line number
set number

" Disable vi compatibility
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlight
syntax enable

" Set system clipboard
set clipboard=unnamed


" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap


" => Command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" More useful command-line completion
set wildmenu



" => Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Backups
set backupdir=~/.vim/tmp/backup//

" Swap files
set directory=~/.vim/tmp/swap//

" Enable backup
set backup

" Dirty tweak to prevent swap-files errors
set directory=.,$TEMP


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use H and L to go to the beggining or end of a line
nnoremap H 0
nnoremap L $

" Disable arrow movement
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable vim color detection
set t_Co=256

" Set dark background
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"Show command in bottom right portion of the screen
set showcmd

" Set font for MacVim
set guifont=Source\ Code\ Pro\ for\ Powerline

" Use the same symbols as TextMate for tabstops and EOLs
scriptencoding utf-8
set encoding=utf-8
set listchars=trail:·,precedes:«,extends:»,tab:▸\ ,eol:↲

" Show matching brackets
set showmatch

" Colorscheme
if has("gui_running")
    set background=dark
    colorscheme peaksea
else
    colorscheme desert
    let g:colors_name="desert"
endif


" => Visual tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight current line
hi CursorLine cterm=NONE ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white

" Map <leader>cl to highlight current line
nmap <leader>cl :set cursorline!<cr>

" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Utilities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,u will set the current word to uppercase
nmap <leader>u vawU<esc>e

" Ctrl-u will set the current word to uppercase while in insert mode
imap <C-u> <esc>vawU<esc>a

" On INSERT mode, Ctrl-d will empty the current line
imap <C-d> <esc>ddO

" Put double and single quotes around the current word
nnoremap <leader>" ea"<esc>hbi"<esc>lel
nnoremap <leader>' ea'<esc>hbi'<esc>lel

" Remap mistakes
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Clear Search matches with <leader><space>
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Window resizing with Ctrl + Shift + Left/Right
nnoremap <c-s-left> 5<c-w>>
nnoremap <c-s-right> 5<c-w><

" Quickfix window with ,/
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Create dictionary for custom expansions
set dictionary+=/Users/Carlos/.vim/dict.txt

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" TODO Commit and push changes
" nmap <A-u> :Git add .<CR>:Git commit<CR>:Git push

" => Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use very-magic regex by default
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quick Toggles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick editing vimrc
nnoremap <leader>ev <C-w>v<C-w>l<C-w>L:e ~/.vimrc<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick access to TO-DO
nnoremap <leader>td <C-w>v<C-w>l<C-w>s<C-w>k:e ~/.todos<cr>

" Clear search highlight
nnoremap <F3> :nohl<CR>

" Pastemode toggle <F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Quick NERDTree open
nnoremap <leader>nt :NERDTreeToggle<cr>

" Show/Hide invisibles with ,l
nmap <leader>l :set list!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


" Function to enable relative numbers with C-n
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


" Customized tabline
function! CustomizedTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
        let s .= '%*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let file = bufname(buflist[winnr - 1])
        let file = fnamemodify(file, ':p:t')
        if file == ''
            let file = '[No Name]'
        endif
        let s .= file
        let s .= ' '
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction

" Always show the tabline
set stal=2
set tabline=%!CustomizedTabLine()


" Add current time to airline, next to file encoding
function! AirlineInit()
    let g:airline_section_y = airline#section#create(['ffenc', ' %{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FileTypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => JSON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => FoldToggle
"""""""""""""""""""""""""""""""""""
" Map Space to fold/unfold
nnoremap <Space> za
vnoremap <Space> za

" Map FoldToggle
nnoremap <leader>ft :FoldToggle<cr>
vnoremap <leader>ft :FoldToggle<cr>

" Enable MarkDown FoldToggle by default
:autocmd BufNewFile,BufRead *.md :FoldToggle
:autocmd BufNewFile,BufRead *.md :set foldcolumn=0


" CtrlP
"""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


" => Airline
"""""""""""""""""""""""""""""""""""
" Change airline theme
let g:airline_theme="murmur"

" Enable powerline fonts on airline
let g:airline_powerline_fonts = 1


" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']

" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Distinct folders
let NERDTreeHijackNetrw = 1
