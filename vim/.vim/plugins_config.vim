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
" => YCM
""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1

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
" => vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'zathura'
nnoremap <leader>lt :VimtexTocToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 0
let g:sneak#use_ic_scs = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autoclose (breaks iabbrev)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoCloseExpandSpace = 0 " Make iabbrev work again

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => terminus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:TerminusInsertCursorShape=2
let g:TerminusMouse=0
