Vim�UnDo� 8tZ�A�(�lə^?w��j�  BR�]	�mI                     )       )   )   )    [5<?    _�                     ?        ����                                                                                                                                                                                                                                                                                                                            ?           C           V        [)�    �   B   D          ;snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>�   A   C          -ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>�   @   B          """"""""""""""""""""""""""""""�   ?   A          -" => snipMate (beside <TAB> support <CTRL-j>)�   >   @          """"""""""""""""""""""""""""""5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        [/�}     �                 ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " Important:   F"       This requries that you install https://github.com/amix/vimrc !   "   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        [/��    �                8call pathogen#infect(s:vim_runtime.'/sources_forked/{}')5�_�                            ����                                                                                                                                                                                                                                                                                                                                       !           V        [0 p     �                """""""""""""""""""""""""""""""   "" => YankStack   """""""""""""""""""""""""""""""   '"let g:yankstack_yank_keys = ['y', 'd']       2"nmap <c-p> <Plug>yankstack_substitute_older_paste   2"nmap <c-n> <Plug>yankstack_substitute_newer_paste5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        [0 r     �                 5�_�                    0        ����                                                                                                                                                                                                                                                                                                                            0           4           V        [0 z     �   /   0          """""""""""""""""""""""""""""""   ."" => snipMate (beside <TAB> support <CTRL-j>)   """""""""""""""""""""""""""""""   ."ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>   <"snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>5�_�                    S        ����                                                                                                                                                                                                                                                                                                                            S           m           V        [0 �    �   R   S          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => lightline   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   let g:lightline = {          \ 'colorscheme': 'wombat',   	      \ }       let g:lightline = {          \ 'colorscheme': 'wombat',         \ 'active': {   &      \   'left': [ ['mode', 'paste'],   G      \             ['fugitive', 'readonly', 'filename', 'modified'] ],   2      \   'right': [ [ 'lineinfo' ], ['percent'] ]   
      \ },         \ 'component': {   D      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',   Q      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',   F      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'   
      \ },   (      \ 'component_visible_condition': {   8      \   'readonly': '(&filetype!="help"&& &readonly)',   G      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',   I      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'   
      \ },   3      \ 'separator': { 'left': ' ', 'right': ' ' },   5      \ 'subseparator': { 'left': ' ', 'right': ' ' }   	      \ }5�_�      	              
        ����                                                                                                                                                                                                                                                                                                                            
                      V        [0�     �   	   
          """"""""""""""""""""""""""""""   " => bufExplorer plugin   """"""""""""""""""""""""""""""   let g:bufExplorerDefaultHelp=0   #let g:bufExplorerShowRelativePath=1   let g:bufExplorerFindActive=1   let g:bufExplorerSortBy='name'   map <leader>o :BufExplorer<cr>5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                            
           
           V        [0M    �         k      """"""""""""""""""""""""""""""5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             [0�i     �                4call pathogen#infect(s:vim_runtime.'/my_plugins/{}')5�_�   
                          ����                                                                                                                                                                                                                                                                                                                                        %           V        [0�u    �                 """"""""""""""""""""""""""""""   " => ZenCoding   """"""""""""""""""""""""""""""   #" Enable all functions in all modes   let g:user_zen_mode='a'    5�_�                   E        ����                                                                                                                                                                                                                                                                                                                            E           K           V        [0��     �   D   E          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => Vimroom   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   let g:goyo_width=100   let g:goyo_margin_top = 2   let g:goyo_margin_bottom = 2   %nnoremap <silent> <leader>z :Goyo<cr>5�_�                            ����                                                                                                                                                                                                                                                                                                                            E           E           V        [0��    �                  5�_�                    F        ����                                                                                                                                                                                                                                                                                                                            F           I           V        [0՟     �   E   F          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => Vim-go   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   "let g:go_fmt_command = "goimports"5�_�                    C        ����                                                                                                                                                                                                                                                                                                                            F           F           V        [0ա     �   B   C           5�_�                    C        ����                                                                                                                                                                                                                                                                                                                            E           E           V        [0բ     �   B   C           5�_�                    C        ����                                                                                                                                                                                                                                                                                                                            D           D           V        [0բ    �   B   C           5�_�                    K        ����                                                                                                                                                                                                                                                                                                                                                             [3��    �   J   K          &\   'go': ['go', 'golint', 'errcheck']5�_�                   N        ����                                                                                                                                                                                                                                                                                                                                                             [3�d     �   M   R   T       �   N   O   T    5�_�                    O   	    ����                                                                                                                                                                                                                                                                                                                                                             [3�m     �   N   P   W      $\   '.*\.json$': {'ale_enabled': 0},5�_�                    P        ����                                                                                                                                                                                                                                                                                                                                                             [3�s    �   O   P          0\   '.*some/folder/.*\.js$': {'ale_enabled': 0},5�_�                    N        ����                                                                                                                                                                                                                                                                                                                                                             [3�v    �   M   O   V    5�_�                    E        ����                                                                                                                                                                                                                                                                                                                            E           Q           V        [58�     �   D   E          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => Syntastic (syntax checker)   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   let g:ale_linters = {   \   'javascript': ['jshint'],   \   'python': ['flake8'],   \}       -nmap <silent> <leader>a <Plug>(ale_next_wrap)       let g:ale_pattern_options = {   #\   '.*\.tex$': {'ale_enabled': 0},   \}5�_�                           ����                                                                                                                                                                                                                                                                                                                            E           E           V        [59�     �      !   J    �          J    5�_�                    *        ����                                                                                                                                                                                                                                                                                                                            *           3           V        [5:.     �   )   *       
   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => Nerd Tree   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   let g:NERDTreeWinPos = "right"   let NERDTreeShowHidden=0   .let NERDTreeIgnore = ['\.pyc$', '__pycache__']   let g:NERDTreeWinSize=35   "map <leader>nn :NERDTreeToggle<cr>   +map <leader>nb :NERDTreeFromBookmark<Space>    map <leader>nf :NERDTreeFind<cr>5�_�                     *        ����                                                                                                                                                                                                                                                                                                                            *           *           V        [5:/     �   )   *           5�_�      !               +        ����                                                                                                                                                                                                                                                                                                                            +           .           V        [5:4     �   *   +          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => vim-multiple-cursors   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   $let g:multi_cursor_next_key="\<C-s>"5�_�       "           !   -        ����                                                                                                                                                                                                                                                                                                                            -           2           V        [5:6     �   ,   -          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => surround.vim config    " Annotate strings with gettext    ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   vmap Si S(i_<esc>f)   2au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>5�_�   !   #           "            ����                                                                                                                                                                                                                                                                                                                                        ,           V        [5::     �                             """"""""""""""""""""""""""""""   " => Vim grep   """"""""""""""""""""""""""""""   2let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'   set grepprg=/bin/grep\ -nH                    5�_�   "   $           #   
        ����                                                                                                                                                                                                                                                                                                                            
                      V        [5:L     �   	   
          """""""""""""""""""""""""""""   " => MRU plugin   """"""""""""""""""""""""""""""   let MRU_Max_Entries = 400   map <leader>f :MRU<CR>5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                                  V        [5;P     �                """"""""""""""""""""""""""""""   " => CTRL-P   """"""""""""""""""""""""""""""   !let g:ctrlp_working_path_mode = 0       let g:ctrlp_map = '<c-f>'   map <leader>j :CtrlP<cr>   map <c-b> :CtrlPBuffer<cr>       let g:ctrlp_max_height = 20   Jlet g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'                    5�_�   $   &           %   	        ����                                                                                                                                                                                                                                                                                                                                                  V        [5;Q     �      
          5�_�   %   '           &   	        ����                                                                                                                                                                                                                                                                                                                            	                     V       [5;T     �      	          jjjjj                5�_�   &   (           '   	        ����                                                                                                                                                                                                                                                                                                                            	          	           V       [5;U     �      	           5�_�   '   )           (           ����                                                                                                                                                                                                                                                                                                                            	          	           V       [5;V     �                 5�_�   (               )   	        ����                                                                                                                                                                                                                                                                                                                            	                      V        [5<>    �      	          ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   " => Git gutter (Git diff)   ?"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   let g:gitgutter_enabled=0   0nnoremap <silent> <leader>d :GitGutterToggle<cr>5�_�                            ����                                                                                                                                                                                                                                                                                                                            F           F           V        [59�     �          J    �          J       5�_�                   J       ����                                                                                                                                                                                                                                                                                                                                                             [3�q     �   J   K   T    �   J   K   T      \   'python': ['flake8'],5�_�                    K       ����                                                                                                                                                                                                                                                                                                                                                             [3�w     �   J   L   U      \   'latex': ['flake8'],5�_�                     K       ����                                                                                                                                                                                                                                                                                                                                                             [3��    �   J   L   U      \   'latex': [],5�_�                    &        ����                                                                                                                                                                                                                                                                                                                                                    V        [0��     �   %   '   d      1et Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'5��