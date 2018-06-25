
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorscheme
Plugin 'morhetz/gruvbox'

""" R
Plugin 'jalvesaq/Nvim-R'
" get completion in R
" Plugin 'roxma/nvim-completion-manager' "still stuff to figure out here
" Plugin 'gaalcaras/ncm-R' "only works if above plugin (nvim-completion-manger) works

" linting requires install.packages('lintr')
Plugin 'w0rp/ale'

" for snippet support
" Plugin 'sirver/UltiSnips' " complains about mmissing python??"

" commentary (gc(c))
Plugin 'tpope/vim-commentary'

" You Complete Me
" Plugin 'Valloric/YouCompleteMe' requires Vim compiled with Python support

" kill ring
Plugin 'maxbrunsfeld/vim-yankstack'

" simply maps all the different vim built in autocompletions to tab
Plugin 'ajh17/VimCompletesMe'

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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
