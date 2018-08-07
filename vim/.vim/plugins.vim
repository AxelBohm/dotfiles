" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorscheme
Plugin 'morhetz/gruvbox'

""" R
Plugin 'jalvesaq/Nvim-R'
" get completion in R
" Plugin 'roxma/nvim-completion-manager' "still stuff to figure out here
" Plugin 'gaalcaras/ncm-R' "only works if above plugin (nvim-completion-manger) works

""" Rmarkdown
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'vim-pandoc/vim-rmarkdown'

""" linting 
" for R needs install.packages('lintr')
Plugin 'w0rp/ale'

" for snippet support
" Plugin 'sirver/UltiSnips' " complains about mmissing python??

" commentary (gc(c))
Plugin 'tpope/vim-commentary'

" You Complete Me
Plugin 'Valloric/YouCompleteMe'

" kill ring
Plugin 'maxbrunsfeld/vim-yankstack'

" simply maps all the different vim built in autocompletions to tab
" Plugin 'ajh17/VimCompletesMe'

""" snippets (snipmate)
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" set rtp+=~/.vim/snippets

" lightline
Plugin 'itchyny/lightline.vim'

" buffer explorer
Plugin 'jlanzarotta/bufexplorer'

" zen mode
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

" change surrounding paranthesis/quotes
Plugin 'tpope/vim-surround'

" " most recently used file browser
" Plugin 'yegappan/mru'

" shows git diffs on the side
Plugin 'airblade/vim-gitgutter'

" consistent navigation between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
