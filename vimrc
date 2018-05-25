set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry


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


" cheap autoclosing for brackets and alike
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

" linenumbers
set number relativenumber
