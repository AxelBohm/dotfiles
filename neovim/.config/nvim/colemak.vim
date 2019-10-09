" get control-j back, so switch it with ctrl-n at qwerty position of j
inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>
noremap <c-l> <c-u>

" " rotate some keys about to get qwerty "hjkl" back for movement
noremap n j
noremap e k
noremap i l

noremap gn gj
noremap ge gk
noremap ci cl

" move these keys to their qwerty positions because they are
" in the way of hjkl (and E for J)
noremap k n
noremap K N
noremap l i
noremap L I
noremap N J
noremap E K
noremap j e
noremap J E

let g:UltiSnipsExpandTrigger='<c-e>'
