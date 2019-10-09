" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorscheme
Plugin 'morhetz/gruvbox'

""" R
Plugin 'jalvesaq/Nvim-R'
" get completion in R
" Plugin 'gaalcaras/ncm-R' "only works if above plugin (nvim-completion-manger) works

""" Rmarkdown
" Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
" Plugin 'vim-pandoc/vim-rmarkdown'

""" run shell commands asynchronously
Plugin 'skywind3000/asyncrun.vim'

""" linting 
" for R needs install.packages('lintr')
Plugin 'w0rp/ale'

" commentary (gc(c))
Plugin 'tpope/vim-commentary'

" You Complete Me
Plugin 'Valloric/YouCompleteMe'

" kill ring
Plugin 'maxbrunsfeld/vim-yankstack'

""" snippets
Plugin 'SirVer/ultisnips'

" lightline
" Plugin 'itchyny/lightline.vim'
" Plugin 'maximbaz/lightline-ale'

" buffer explorer
Plugin 'jlanzarotta/bufexplorer'

" zen mode
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

" change surrounding paranthesis/quotes
Plugin 'tpope/vim-surround'
"
" consistent navigation between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

" buffers as tabs on top
" Plugin 'ap/vim-buftabline'

" fancy start screen
Plugin 'mhinz/vim-startify'

""" LaTeX
Plugin 'lervag/vimtex'
"
" two char "
Plugin 'justinmk/vim-sneak'

" orgmode
Plugin 'jceb/vim-orgmode'

" change curser shape when in insert
Plugin 'wincent/terminus'

" autoclose parenthesis
Plugin 'Townk/vim-autoclose'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
