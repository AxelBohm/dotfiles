""""""""""""""""""""""""""""""
" => R
""""""""""""""""""""""""""""""

let g:Rout_more_colors = 1
let g:rout_follow_colorscheme = 1

nmap <leader>, <Plug>RSendLine
vmap <leader>, <Plug>RDSendSelection
" vmap ,e <Plug>RESendSelection
nmap <leader>aa <Plug>RSendFile
" nmap <leader>rf \rf
nmap <leader>rs <Plug>RStart
nmap <leader>rc <Plug>RClose
nmap <C-]> <Plug>RSendLine<esc>j

" run r in tmux
let R_source = '~/.vim/bundle/Nvim-R/R/tmux_split.vim'


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let g:pandoc#syntax#conceal#use = 0


""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-f>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" set color to components
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 
        \   'right': [ 
        \   ['lineinfo'], ['percent'],
        \   ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']
        \   ]
\}

"" requires nerdfonts and fontawesome
" let g:lightline#ale#indicator_warnings = "\uf071"
" let g:lightline#ale#indicator_errors = "\uf05e"


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => buftabline
""""""""""""""""""""""""""""""
let g:buftabline_show=0


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

" lets you quit goyo _and vim_ at the same time
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  highlight Normal ctermbg=NONE
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_pattern_options = {
" \   '.*\.tex$': {'ale_enabled': 0},
" \}

nmap <silent> <leader>a :ALEToggle<cr>
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex live preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'zathura'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => terminus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:TerminusInsertCursorShape=2
let g:TerminusMouse=0
