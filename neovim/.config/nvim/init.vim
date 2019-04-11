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

" buffers in tabline
Plug 'ap/vim-buftabline'

" linting 
Plug 'w0rp/ale'

" You Complete Me
Plug 'Valloric/YouCompleteMe'

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

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""

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

map <leader>n :UltiSnipsEdit<CR> " fast snippet configuring

" autoclose
let g:AutoCloseExpandSpace = 0 " Make iabbrev work again

" when to show buftabline
let g:buftabline_show = 1

"hardtime
let g:hardtime_default_on = 1

" statusline configuration
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
	\ 'subseparator': { 'left': '░', 'right': '░' },
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

"""""""""""""""""""""""""""""""""""""""""""""""""
" => general config
"""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
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
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" activate spell checking
nnoremap <leader>ss :set spell!<cr>

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

set spellfile=~/.vim/spell/en.utf-8.add


"""""""""""""""""""""""""""""""""
" => filetype config
"""""""""""""""""""""""""""""""""

" LaTex
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
