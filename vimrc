
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
" Plugin 'roxma/nvim-completion-manager' "still stuff to figure out here"
Plugin 'gaalcaras/ncm-R'

" linting requires install.packages('lintr')
Plugin 'w0rp/ale'

" for snippet support
" Plugin 'sirver/UltiSnips' " complains about mmissing python??"


" You Complete Me
" Plugin 'Valloric/YouCompleteMe' requires Vim compiled with Python support


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"-----------------------------------------------------------
"-----------------------------------------------------------

"otherwise colors don't work in most terminals..
set t_Co=256

" protect those pinkies
nnoremap <leader>s /

" Make Y behave like other commands
nnoremap Y y$

" press j and k at the same time to get escape
inoremap jk <esc>
inoremap kj <esc>

" Fast saving
nmap <leader>w :w!<cr>

" Fast save plus quit
map <leader>q :wq!<cr>

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
set clipboard=unnamed

" wrap words after visual selection
vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap $ <esc>`>a$<esc>`<i$<esc>


""" R config stuff

let g:Rout_more_colors = 1
let g:rout_follow_colorscheme = 1

nmap <leader>, <Plug>RSendLine
vmap <leader>, <Plug>RDSendSelection
" vmap ,e <Plug>RESendSelection

