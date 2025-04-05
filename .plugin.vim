" Tmux ------------------------------ {{{

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" vim-tmux-navigator ---------------- {{{
"
"  let g:tmux_navigator_no_mappings = 1
"  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
"  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
"  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
"  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
"
"if has('nvim')
"  tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
"  tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
"  tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
"  tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
"  tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>
"
"  " Neovim terminal mapping
"  " terminal 'normal mode'
"  tmap <esc> <c-\><c-n><esc><cr>
"
"  set re=1 " Use the old regex engine to make render rb file faster in terminal
"endif


" }}}

" }}}
