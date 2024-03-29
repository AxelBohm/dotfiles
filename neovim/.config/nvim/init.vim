" set leader (has to be before any leader command is defined)
nnoremap <space> <Nop>
let mapleader = ' '
let maplocalleader = ','


""""""""""""""""""""""""""
" => load plugins
""""""""""""""""""""""""""
set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')


" auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'
Plug 'neovim/nvim-lspconfig'     " collection of common configurations for LSP client
Plug 'prabirshrestha/vim-lsp'
Plug 'JuliaEditorSupport/julia-vim'   " Julia support (syntax highligthing,...)
Plug 'deoplete-plugins/deoplete-jedi' " python autocompletion

Plug 'dense-analysis/ale'                 " linting 
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lervag/vimtex'                " LaTeX
Plug 'airblade/vim-gitgutter'       " git integration
Plug 'sheerun/vim-polyglot'         " syntax highligthing for many languages

" Editor
Plug 'jiangmiao/auto-pairs'     " autoclose parenthesis
Plug 'tpope/vim-surround'       " change surrounding parenthesis/quotes
Plug 'isa/vim-matchit'          " extend % functionality
Plug 'tpope/vim-commentary'     " commentary (gc(c))
Plug 'justinmk/vim-sneak'       " two char find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jceb/vim-orgmode'         " orgmode

" UI
Plug 'xero/sourcerer.vim'               " colorscheme
Plug 'norcalli/nvim-colorizer.lua'      " color highlight
Plug 'machakann/vim-highlightedyank'    " blink yanks
Plug 'itchyny/lightline.vim'            " status line

" misc
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
endif

" fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>.    :FZF<cr>
nnoremap <silent> <leader>,    :FzfHistory<cr>
nnoremap <silent> <leader>bb   :FzfBuffers<cr>


" lsp config for julia
lua << EOF
    require'lspconfig'.julials.setup{}
EOF
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>lh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>lk    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.references()<CR>


" colorizer
 set termguicolors
lua require'colorizer'.setup()

" colorsheme
colorscheme sourcerer

" highlightedyank
let g:highlightedyank_highlight_duration = 250
highlight HighlightedyankRegion ctermbg=white ctermfg=red guibg=#686858

" vim inside web browser
if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    set laststatus=0 nonumber noruler noshowcmd

    augroup firenvim
        autocmd!
        autocmd BufEnter *.txt setlocal filetype=markdown.pandoc
    augroup END
endif

" deoplete autocomplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" let g:deoplete#sources#jedi#show_docstring = 0
let g:deoplete#sources#jedi#ignore_errors = 1

" register language server
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

" ale
nmap <silent> <leader>ta :ALEToggle<cr>
let g:ale_lint_on_enter = 0
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>ap :ALEPrevious<cr>

" vimtex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = "latexmk"
set conceallevel=1
let g:tex_conceal='abdmg'
" autocmd Filetype latex nnoremp <buffer> <localleader>v :VimtexView<cr> " not quite working

hi clear Conceal
hi Conceal cterm=NONE ctermbg=NONE ctermfg=darkblue

" ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-f>'

map <leader>n :UltiSnipsEdit<CR> " fast snippet configuring
map <leader>sn :UltiSnipsEdit<CR> " fast snippet configuring

" statusline configuration
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
    \ 'subseparator': { 'left': '', 'right': '░' },
    \ 'active': {
    \   'right': [ [ 'lineinfo' ], ['percent'] ]
    \ },
    \ 'tabline': {
    \   'left': [['buffers']],
    \   'right': [['']]
    \},
    \ 'component_expand': {
    \ 'buffers': 'lightline#bufferline#buffers'
    \},
    \ 'component_type': {'buffers': 'tabsel'},
    \ }

let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'V',
        \ "\<C-v>": 'V',
        \ 's' : 'S',
        \ 'S' : 'S',
        \ "\<C-s>": 'S'
        \ }

" show lightline-bufferline
" set showtabline=2

let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""
" => general config
"""""""""""""""""""""""""""""""""""""""""""""""""
" make transparency work
highlight Normal guibg=NONE ctermbg=NONE

" no statusline
set laststatus=2

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

" linenumbers
set relativenumber

" avoid escape
inoremap jk <esc>

" save and quit from insert mode
inoremap <C-c> <Esc>:wq<CR>

" Fast saving
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>

" consistency
nnoremap Y y$

" format entire and go back to previous position
nnoremap <leader>f gggqG<C-o><C-o>

 " :W sudo saves the file 
command! W w !sudo tee % > /dev/null
 
" resize
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

" switch buffer
nnoremap <leader>bd :bp \| bd #<CR>     

" activate spell checking
nnoremap <leader>ts :set spell!<cr>   "toggle spell
set spellfile=~/.vim/spell/en.utf-8.add
" accept first correction suggestion
nnoremap <leader>sc 1z=
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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

" " show whitespace
" set list

" don't immediately complete first suggestion
set wildmode=longest:full,full

" ignore files when :e or ^P
set wildignore+=*.aux,*.log,*.fls,*.fdb_latexmk,*.blg,*.synctex.gz,*.pdf

" set working dir to dir of file
set autochdir

" abbreviaions
iabbrev taht that
iabbrev teh the
iabbrev wsl wahrscheinlich
iabbrev lsc lower semicontinuous
iabbrev wrt with respect to
iabbrev frechet Fr\'echet

" open last buffer
nnoremap <leader><leader> <C-^>

" get rid of search highlights
nnoremap <esc> :noh<CR>
nnoremap <C-space> <Nop>

"""""""""""""""""""""""""""""""""
" => filetype config
"""""""""""""""""""""""""""""""""

" LaTex
augroup latex
    autocmd!
    autocmd FileType tex setlocal shiftwidth=2 tabstop=2

    autocmd FileType tex inoremap ;j ^{}<left>
    autocmd FileType tex inoremap ;k _{}<left>
    autocmd FileType tex inoremap ;r \R
    autocmd FileType tex inoremap ;e _k
    autocmd FileType tex inoremap ;n _{k+1}
    autocmd FileType tex inoremap ;h _{k+2}
    autocmd FileType tex inoremap ;i _{k-1}
    autocmd FileType tex inoremap ;u ^{k}
    autocmd FileType tex inoremap ;l ^{k+1}
    autocmd FileType tex inoremap ;s ^*
    autocmd FileType tex inoremap ;t ^2

    autocmd FileType tex inoremap xkk x_k
    autocmd FileType tex inoremap ykk y_k

    hi clear Conceal
    hi Conceal cterm=NONE ctermbg=NONE ctermfg=darkblue

augroup END

" mail
augroup mail
    autocmd FileType mail setlocal spell
    autocmd FileType mail setlocal spelllang=en,de
augroup END

augroup python
    " use autopep8 for reformatting
    autocmd FileType python setlocal formatprg=autopep8\ -
augroup END

" augroup myvimrc
"     au!
"     au BufWritePost init.vim so ~/config/nvim/init.vim
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing / searches for the current selection
vnoremap <silent> / :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute 'normal! vgvy'

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", '', '')

    if a:direction == 'gv'
        call feedkeys(':' . "Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call feedkeys(':' . '%s' . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" source remaps for colemak
source ~/.config/nvim/colemak.vim
