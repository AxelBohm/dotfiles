
" set leader (has to be before any leader command is defined)
nnoremap <space> <Nop>
let mapleader = " "


set runtimepath+=~/.vim_runtime
set runtimepath+=~/.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim


source ~/.vim/plugins.vim
source ~/.vim/plugins_config.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox
set t_Co=256                "colors in terminal
syntax enable               "syntax highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to auto read when a file is changed from the outside
set autoread

" A buffer becomes hidden when it is abandoned
set hidden

set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" duration vim waits for next key in command chain
set timeoutlen=300

" Turn backup off
set nobackup
set nowb
set noswapfile

"Hide mouse when typing
set mousehide

" highlight entire line of curser
set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" search into subfolders when using :find
set path+=**

" Always show the status line
set laststatus=2

" Turn on the Wild menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nifty custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call yankstack#setup()

" Make Y behave like other commands
nnoremap Y y$

" $ is  a pain. use L instead. i never use L anyways..
noremap L $
noremap H ^

" press j and k at the same time to get escape
inoremap jk <esc>
inoremap kj <esc>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast quit
nnoremap <leader>q :q<cr>

" Fast save and quit
nnoremap <leader>x :wq<cr>

" colon is annoying
nnoremap <leader>; :

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" linenumbers
set number relativenumber

" copy to clipboard
set clipboard=unnamedplus

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Add a bit extra margin to the left
" set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
" set linebreak
" set textwidth=500

set autoindent 
set smartindent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Brackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" cheap autoclosing for brackets and alike
inoremap " ""<left>
" ino ' ''<left> "keeps messing with my apostrophes (maybe i shouldn't use so much slang)
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" wrap words after visual selection
vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap $ <esc>`>a$<esc>`<i$<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Resize splits
nnoremap ;h :vertical resize +5<cr>
nnoremap ;l :vertical resize -5<cr>
nnoremap ;k :resize +5<cr>
nnoremap ;j :resize -5<cr>
nnoremap <leader>1 <c-w>=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>bd :bdelete<cr>     " delete the current buffer

map <leader>bl :bnext<cr>
map <leader>bh :bprevious<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" underscore is just so hard to reach
inoremap <C-u> _

" a little emacs behaviour
inoremap <C-F> <Right>

" insert empty line without leaving normal mode
nnoremap <leader>ij o<esc>
nnoremap <leader>ik O<esc>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P>      <Up>
cnoremap <C-N>      <Down>

" Quickly open a markdown buffer for scribble
map <leader>m :e ~/scribbles.md<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc nested source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd FileType r inoremap ;m %>%
" think about a better command for <- than _ 


""" LaTex

" Compile document
" autocmd FileType tex inoremap <F5> <Esc>:w <cr>:!latexmk % <cr><cr>
autocmd FileType tex nnoremap <leader>, :w <cr>:!latexmk % <cr><cr>
autocmd FileType tex inoremap ;h ^{}<left> 
autocmd FileType tex inoremap ;u _{}<left> 
autocmd FileType tex inoremap ;r \R
autocmd FileType tex inoremap ;f function






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing / searches for the current selection
vnoremap <silent> / :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" deletes everything until the last slash when browsing on the command line
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")

    if g:cmd == g:cmd_edited
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif   

    return g:cmd_edited
endfunc

cno <C-BS> <C-\>eDeleteTillSlash()<cr>



" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
