" set leader (has to be before any leader command is defined)
nnoremap <space> <Nop>
let mapleader = ' '
let maplocalleader = ' '


""""""""""""""""""""""""""
" => load plugins
""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plug.vim')

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" buffers in tabline
Plug 'ap/vim-buftabline'

" linting 
Plug 'w0rp/ale'

" You Complete Me
" Plug 'Valloric/YouCompleteMe'

" snippets
Plug 'SirVer/ultisnips'

" commentary (gc(c))
Plug 'tpope/vim-commentary'

" consistent navigation between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" LaTeX
Plug 'lervag/vimtex'

" autoclose parenthesis
Plug 'Townk/vim-autoclose'

" two char find
Plug 'justinmk/vim-sneak'

" change surrounding paranthesis/quotes
Plug 'tpope/vim-surround'

" orgmode
Plug 'jceb/vim-orgmode'

" statusline
Plug 'itchyny/lightline.vim'

Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete autocomplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ale
nmap <silent> <leader>a :ALEToggle<cr>
let g:ale_lint_on_enter = 0

" vimtex
let g:vimtex_view_method = 'zathura'
"
" YCM
let g:ycm_autoclose_preview_window_after_completion = 1

" ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-f>'

map <leader>n :UltiSnipsEdit<CR> " fast snippet configuring

" autoclose
let g:AutoCloseExpandSpace = 0 " Make iabbrev work again

" when to show buftabline
let g:buftabline_show = 1

" statusline configuration
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
    \ 'subseparator': { 'left': '', 'right': '░' },
    \ 'active': {
    \ 'right': [ [ 'lineinfo' ], ['percent'] ]
    \ },
    \ }

" " statusline background override
" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
" let s:palette.inactive.middle = s:palette.normal.middle
" let s:palette.tabline.middle = s:palette.normal.middle
" call insert(s:palette.normal.right, s:palette.normal.left[1], 0)

let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_max_files=0

"""""""""""""""""""""""""""""""""""""""""""""""""
" => general config
"""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme base16-oceanicnext
highlight Normal ctermbg=NONE

" highlight entire line of curser
set cursorline

" copy to X clipboard
set clipboard+=unnamedplus

" default split position
set splitright
set splitbelow

" Ignore case when searching
set ignorecase

" don't move all the way to top/bottom when using j/k
set scrolloff=7

" A buffer becomes hidden when it is abandoned
set hidden

" show mode (insert/normal/..)
set noshowmode

" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" avoid escape
inoremap jk <esc>

" Fast saving
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q!<cr>

 " :W sudo saves the file 
command! W w !sudo tee % > /dev/null
 
" move between windows
nnoremap <M-j> <C-W>j
nnoremap <M-k> <C-W>k
nnoremap <M-h> <C-W>h
nnoremap <M-l> <C-W>l

" resize
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

" switch buffer
" nnoremap <C-N> :bnext<CR>
" nnoremap <C-P> :bprev<CR>

" activate spell checking
nnoremap <leader>ss :set spell!<cr>
set spellfile=~/.vim/spell/en.utf-8.add
" accept first correction suggestion
nnoremap <leader>sc 1z=

" configure statusline
highlight StatusLine ctermbg=0 cterm=NONE

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" persistent undo
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" folding
set foldmethod=syntax

" " show whitespace
" set list

" don't immediately complete first suggestion
set wildmode=longest:full,full

" set working dir to dir of file
set autochdir

" abbreviaions
iabbrev taht that
iabbrev lsc lower semicontinuous
iabbrev wrt with respect to

" open last buffer
nnoremap <leader><leader> <C-^>

"""""""""""""""""""""""""""""""""
" => filetype config
"""""""""""""""""""""""""""""""""

" LaTex
augroup latex
    autocmd!
    autocmd FileType tex setlocal shiftwidth=2 tabstop=2

    autocmd FileType tex inoremap ;n ^{}<left>
    autocmd FileType tex inoremap ;m _{}<left>
    autocmd FileType tex inoremap ;r \R
    autocmd FileType tex inoremap ;k _{k}
    autocmd FileType tex inoremap ;j _{k+1}
    autocmd FileType tex inoremap ;h _{k+2}
    autocmd FileType tex inoremap ;l _{k-1}
    autocmd FileType tex inoremap ;i ^{k}
    autocmd FileType tex inoremap ;u ^{k+1}
    autocmd FileType tex inoremap ;s ^*
    autocmd FileType tex inoremap ;t ^2
augroup END

" mail
augroup mail
    autocmd FileType mail setlocal spell
    autocmd FileType mail setlocal spelllang=en,de
augroup END

