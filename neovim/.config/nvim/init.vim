" set leader (has to be before any leader command is defined)
nnoremap <space> <Nop>
let mapleader = ' '
let maplocalleader = ' '

" Load vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plug.vim')
" colorscheme
Plug 'morhetz/gruvbox'

" " buffers in tabline
" Plug 'ap/vim-buftabline'

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

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ale
nmap <silent> <leader>a :ALEToggle<cr>
let g:ale_lint_on_enter = 0

" vimtex
let g:vimtex_view_method = 'zathura'

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1

" ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<c-j>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
highlight Normal ctermbg=NONE

" Ignore case when searching
set ignorecase

" don't move all the way to top/bottom when using j/k
set scrolloff=7

" avoid escape
inoremap jk <esc>

" Fast saving
nnoremap <leader>w :w!<cr>

" A buffer becomes hidden when it is abandoned
set hidden
  
" move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" activate spell checking
nnoremap <leader>ss :set spell!<cr>

" show mode (insert/normal/..)
set noshowmode

" configure statusline
highlight StatusLine ctermbg=0 cterm=NONE

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LaTex
autocmd FileType tex setlocal shiftwidth=2 tabstop=2

autocmd FileType tex inoremap ;n ^{}<left>
autocmd FileType tex inoremap ;m _{}<left>
autocmd FileType tex inoremap ;r \R
autocmd FileType tex inoremap ;k _{k}
autocmd FileType tex inoremap ;j _{k+1}
autocmd FileType tex inoremap ;l _{k-1}
autocmd FileType tex inoremap ;i ^{k}
autocmd FileType tex inoremap ;u ^{k+1}
autocmd FileType tex inoremap ;s ^*
autocmd FileType tex inoremap ;t ^2
