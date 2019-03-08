" set leader (has to be before any leader command is defined)
nnoremap <space> <Nop>
let mapleader = ' '

" Load vim-plug
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

""" LaTeX
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()

colorscheme gruvbox
highlight Normal ctermbg=NONE

" avoid escape
inoremap jk <esc>

" A buffer becomes hidden when it is abandoned
set hidden
  
" move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
