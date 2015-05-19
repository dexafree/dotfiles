"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimPlug call
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" => Personal plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
Plug 'scrooloose/nerdtree'

" Vim-Airline
Plug 'bling/vim-airline'

" CtrlP
Plug 'kien/ctrlp.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Vim-surround
Plug 'tpope/vim-surround'

" Syntastic
Plug 'scrooloose/syntastic'

" Vim-markdown
Plug 'tpope/vim-markdown'

" Vim-markdown-folding
Plug 'nelstrom/vim-markdown-folding'

" MRU (Most Recently Used)
Plug 'yegappan/mru'

" JSON syntax-highlight
Plug 'elzr/vim-json'

" Peaksea colorscheme
Plug 'vim-scripts/peaksea'

" ACK
Plug 'mileszs/ack.vim'

" FuGITive
Plug 'tpope/vim-fugitive'

" AutoClose
Plug 'Townk/vim-autoclose'

" UltiSnips
Plug 'SirVer/ultisnips'

" Vim-Sneak
Plug 'justinmk/vim-sneak'

" Clever-f (f F improved)
Plug 'rhysd/clever-f.vim'

" Swift syntax
Plug 'Keithbsmiley/swift.vim'

" Multiple cursors
" Plug 'terryma/vim-multiple-cursors'

" Rust syntax
Plug 'rust-lang/rust.vim'

call plug#end()       " required
filetype indent on    " required


" => How to use VimPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Installing plugins (requires restarting vim/re-sourcing .vimrc)
" :PlugInstall

" Updating plugins
" :PlugUpdate

" Removing plugins
" :PlugClean
"
" Upgrade VimPlug
" :PlugUpgrade
"
" Create plugins snapshot
" :PlugSnapshot [output path]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:python_host_prog = "/usr/local/bin/python2.7"

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
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Timeout length at 500ms
" TODO: Try decreasing it
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

" Map j and k to go one line down/up even in wrapped lines
nnoremap j gj
nnoremap k gk

" => Command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" More useful command-line completion
set wildmenu

" => Autocompletion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" Will insert tab at beginning of line
" Will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Actual mapping (made silent in order not to show every call)
inoremap <silent> <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>


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

" New tab
nnoremap <C-t>n :tabnew<CR>

" GoToMark changed to º for Spanish Keyboard
nnoremap º `

" Re-indent buffer
nnoremap <leader>i migg=G`i

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
noremap <C-j> <C-w>j
noremap <C-h> <C-W>h
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" After searching, center the cursor
nnoremap n nzz


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
    colorscheme desert
"    colorscheme peaksea
    let g:colors_name="monokai"
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

" Open new empty buffer with <C-w>n, and place it to the right
nnoremap <C-w>n :vnew<CR><C-w>L

" Quickfix window with ,/
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Create dictionary for custom expansions
set dictionary+=/Users/Carlos/.vim/dict.txt

" Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h
autocmd BufEnter * if @% !~ "^term" | cd %:p:h | endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" TODO Commit and push changes
" nmap <A-u> :Git add .<CR>:Git commit<CR>:Git push

" Set Markdown H1 title
nnoremap <leader>1 yypVr=

" Convert to Markdown H2 title
nnoremap <leader>#2 0i## <ESC>

" Convert to Markdown H3 title
nnoremap <leader>#3 0i### <ESC>

" Convert to Markdown H4 title
nnoremap <leader>#4 0i#### <ESC>

" Convert to Markdown H5 title
nnoremap <leader>#5 0i##### <ESC>

" Convert to Markdown H6 title
nnoremap <leader>#6 0i###### <ESC>


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
    endif
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
    let g:airline_section_y = airline#section#create(['ffenc', ' %{strftime("%H:%M")}  %{system("cat ~/.battery")}'])
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
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']


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

" => Markdown syntax fenced blocks
""""""""""""""""""""""""""""""""""

au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'java', 'c', 'sql']

" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Distinct folders
let NERDTreeHijackNetrw = 1

" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When running :UltiSnipsEdit, open a new panel split in vertical
let g:UltiSnipsEditSplit="vertical"

" As I have defined <Tab> as completion, use Ctrl+e to expand the snippet
let g:UltiSnipsExpandTrigger="<C-e>"

" => VimSneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map SneakPrevious to ?, as , is set to <leader>
nmap ? <Plug>SneakPrevious

" => AckVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :Ack<SPACE>
let g:ackprg = 'ag --vimgrep'
