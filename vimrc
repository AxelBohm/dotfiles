
" set leader (has to be before any leader command is defined)
nnoremap <space> <Nop>
let mapleader = " "



set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" R
Plugin 'jalvesaq/Nvim-R'
" get completion in R
Plugin 'roxma/nvim-completion-manager' "still stuff to figure out here
Plugin 'gaalcaras/ncm-R' "only works if above plugin (nvim-completion-manger) works

" linting requires install.packages('lintr')
Plugin 'w0rp/ale'

" for snippet support
" Plugin 'sirver/UltiSnips' " complains about mmissing python??"

" commentary (gc(c))
Plugin 'tpope/vim-commentary'

" You Complete Me
" Plugin 'Valloric/YouCompleteMe' requires Vim compiled with Python support

" simply maps all the different vim built in autocompletions to tab
Plugin 'ajh17/VimCompletesMe'

""" snippets (snipmate)
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
set rtp+=~/.vim/snippets


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"-----------------------------------------------------------
"-----------------------------------------------------------

" Colorscheme
set background=dark
colorscheme gruvbox

"otherwise colors don't work in most terminals..
set t_Co=256

" Enable syntax highlighting
syntax enable 

" duration vim waits for next key in command chain
set timeoutlen=300

"Hide mouse when typing
set mousehide

" highlight entire line of curser
set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" search into subfolders when using :find
set path+=**

" protect those pinkies
" nnoremap <leader>s /

" Make Y behave like other commands
nnoremap Y y$

" $ is  a pain. use L instead. i never use L anyways..
nnoremap L $

" press j and k at the same time to get escape
inoremap jk <esc>
inoremap kj <esc>

" underscore is just so hard to reach
inoremap <C-u> _

" Fast saving
nmap <leader>w :w!<cr>

" Fast save plus quit
nmap <leader>q :wq!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" a little emacs behaviour
inoremap <C-F> <Right>

" cheap autoclosing for brackets and alike
ino " ""<left>
" ino ' ''<left> "keeps messing with my apostrophes (maybe i shouldn't use so much slang)
ino ( ()<left>
ino [ []<left>
ino { {}<left>
" ino {<CR> {<CR>}<ESC>O "i'm not fast enough for this

" insert empty line without leaving normal mode
nnoremap <leader>ij o<esc>
nnoremap <leader>ik O<esc>

" linenumbers
set number relativenumber

" copy to clipboard
set clipboard=unnamedplus

" wrap words after visual selection
vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap $ <esc>`>a$<esc>`<i$<esc>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry



""" R config stuff

let g:Rout_more_colors = 1
let g:rout_follow_colorscheme = 1

nmap <leader>, <Plug>RSendLine
vmap <leader>, <Plug>RDSendSelection
" vmap ,e <Plug>RESendSelection
nmap <leader>aa <Plug>>RSendFile
" nmap <leader>rf \rf
nmap <leader>rs <Plug>RStart
nmap <leader>rc <Plug>RClose

" think about a better command for <- than _ 
" what about the pipe aka %>%


""" LaTex

" Compile document
" autocmd FileType tex inoremap <F5> <Esc>:w <cr>:!latexmk % <cr><cr>
autocmd FileType tex nnoremap <leader>, :w <cr>:!latexmk % <cr><cr>


""" Markdown

" no folding since i don't know how to unfold
let g:vim_markdown_folding_disabled = 1

" compile latex
let g:vim_markdown_math = 1

" dislplay eg __ __ as bold/italic
set conceallevel=2


""" snippets
imap <C-cr> <Plug>snipMateNextOrTrigger 




"""" helper functions

" Visual mode pressing / searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> / :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

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
