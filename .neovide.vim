set clipboard+=unnamedplus
map <D-v> "+p<CR>
map! <D-v> <C-R>+
tmap <D-v> <C-R>+
vmap <D-c> "+y<CR>

if has('gui_running')

    " GUI Vim
    let macvim_skip_colorscheme=1 " respect color settings in .vimrc
    set guifont=SauceCodePro\ Nerd\ Font:h20

    set mouse=a

    " Remove all the UI cruft
    set guioptions-=T " Removes top toolbar
    set guioptions-=r " Removes right hand scroll bar
    set go-=L " Removes left hand scroll bar
    set go-=l
    set go-=R

    "highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    " set guicursor=n-c:block-Cursor-blinkon0
    " set guicursor+=v:block-vCursor-blinkon0
    " set guicursor+=i-ci:ver20-iCursor

    " cmd indention
    nmap <D-[> <<
    nmap <D-]> >>
    vmap <D-[> <gv
    vmap <D-]> >gv


    " copying and pasting
    set clipboard+=unnamedplus

    let g:startify_disable_at_vimenter = 1
    autocmd VimEnter execute "normal <leader>ns"
endif


if has("gui_vimr")
  " VimR specific settings like
  " set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Pomicons:h18
  set guifont=SauceCodePro\ Nerd\ Font:h20

  " Remove all the UI cruft
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar
  set go-=l
  set go-=R

  let g:startify_disable_at_vimenter = 1
  autocmd VimEnter execute "normal <leader>ns"
endif

highlight OverLength ctermbg=yellow ctermfg=black guibg=#592929

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
" }}}


let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
set virtualedit=
set display+=lastline




  " Make files look nice
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  autocmd FileType css,scss,sass :ColorHighlight


" Typescript & Javscript omni complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimjs#casesensistive = 1

  let g:vimjs#smartcomplete = 0
  let g:vimjs#chromeapis = 0
  autocmd FileType typescript inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  let g:typescript_indent_disable = 1
  autocmd FileType typescript setlocal completeopt-=preview


" Emmet customization
" Enable Emmet in all modes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:user_emmet_mode='a'
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
   return "\<tab>"
   endfunction
   autocmd FileType html imap <buffer><expr><tab> <sid>expand_html_tab()

   let g:use_emmet_complete_tag = 1
   let g:user_emmet_install_global = 0
   autocmd FileType html,css,ejs EmmetInstall





if exists("g:neovide")
  set guifont=SauceCodePro\ Nerd\ Font:h20

  let g:neovide_hide_mouse_when_typing = v:true

  let g:neovide_window_blurred = v:true
  let g:neovide_floating_blur_amount_x = 2.0
  let g:neovide_floating_blur_amount_y = 2.0

  let g:neovide_scroll_animation_length = 0.0
  let g:neovide_cursor_trail_size = 0.0
  let g:neovide_cursor_antialiasing = v:false

  let g:neovide_cursor_vfx_mode = ""

  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_animation_length = 0.0

  let g:neovide_cursor_animate_in_insert_mode = v:false
  let g:neovide_cursor_animate_command_line = v:false


  nnoremap <C-k> <C-u>
  nnoremap <C-j> <C-d>
end
