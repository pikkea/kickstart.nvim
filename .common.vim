" Basic options ------------------------------------------------------------ {{{
set nu
set rnu

set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«

" go to the matching brackets etc
noremap <tab> %
vnoremap <tab> %

" }}}
" Quick editing ------------------------------------------------------------ {{{
map <F7> 30j<CR>
map <F8> 30k<CR>

" Uppercase (More convenient than using ~ and going back and forth)
" Note that this will overwrite the contents of the z mark.
inoremap <C-u> <esc>mzgUiw`za

" nnoremap <space> :
" in normal mode, ; to enter cmd mode
" below introduces an issue shown in cmd mode, e.g. :.,.+745;157;1980;3140
" nnoremap ; :
nnoremap ;; :

" Buffers
" Create a new buffer and set filetype
nmap <silent> ,n :enew<CR>:set ft=python<CR>
nmap <silent> ,np :enew<CR>:set ft=python<CR>
nmap <silent> ,nr :enew<CR>:set ft=ruby<CR>
nmap <silent> ,ns :enew<CR>:set ft=scala<CR>
nmap <silent> ,nj :enew<CR>:set ft=javascript<CR>

" Close a buffer
nnoremap ,x :bd<cr>
nnoremap ,X :bd!<cr>

noremap ,h ^
nnoremap ,l A

" Switch between the last two files
nnoremap ,, <c-^>

nmap <silent> ,j :bn<CR>
nmap <silent> ,k :bp<CR>

" Open QuickFix 
nnoremap ,q q:

nmap <silent> ,s :w<CR>

" Reload current buffer
nnoremap ,; :e!<cr>

nmap <silent> ,y :%y<CR>
nmap <silent> ,0 :%d<CR>

nmap <silent> ,z :qa!<CR>


" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,cr :lcd <c-r>=FindGitDirOrRoot()<cr><cr>
nmap <silent> ,md :!mkdir -p %:p:h<CR>


" Keep the cursor in place while joining lines
nnoremap J mzJ`z

nnoremap gw 0f=w

" Del text in current line but WITHOUT <CR>
nnoremap ,v 0v$hd

" Insert the current datestamp
:nnoremap ,d i<ESC>"=strftime("%b %d, %Y")<CR>p
:inoremap ,d <SPACE><ESC>"=strftime("%b %d, %Y")<CR>P

" Substitute
" %s in normal mode
" selected texts in visual mode
nnoremap ,r :%s///g<left><left><left>
vnoremap ,r :s///g<left><left><left>

" Search-and-replace now is a breeze! Faster than %s/thing/another_thing/gc
" 1. Search things usual way using /something
" 2. hit vs, replace first match, and hit jj
" 3. hit n.n.n.n.n. reviewing and replacing all matches
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" }}}
" Utilities ------------------------------------------------------------ {{{
function! FindGitDirOrRoot()
  let filedir = expand('%:p:h')
  if isdirectory(filedir)
    let cmd = 'bash -c "(cd ' . filedir . '; git rev-parse --show-toplevel 2>/dev/null)"'
    let gitdir = system(cmd)
    if strlen(gitdir) == 0
      return '/'
    else
      return gitdir[:-2] " chomp
    endif
  else
    return '/'
  endif
endfunction

"}}}
" Command editing ---------------------------------------------------------- {{{
" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-B>      <Left>
cnoremap <C-F>      <Right>
cnoremap <C-P>      <Up>
cnoremap <C-N>      <Down>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
" cnoremap <ESC><C-H> <C-W>

" Pull last visually selected area onto command-line mode
cnoremap ,9 <C-R>=fnameescape(getline("'<")[ getpos("'<")[2]-1 : getpos("'>")[2]-1 ])<CR>

" }}}
" Highlight Word {{{

" Show different colors of words highlighted simultaneously using <leader>N where N is
" a number from 1-6.
function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}
" Mappings {{{

" MarkChanged {{{

sign define line_changed text=+ texthl=DiffAdded

function! MarkChanged(s, e)
    for i in range(a:s, a:e)
        exe ":sign place " . i . " line=" . i . " name=line_changed file=" . expand("%:p")
    endfor
endfunction

function! MarkUnchanged(s, e)
    for i in range(a:s, a:e)
        call cursor(i, 0)
        silent! sign unplace
    endfor
endfunction

command! -range MarkChanged call MarkChanged(<line1>, <line2>)
command! -range MarkUnchanged call MarkUnchanged(<line1>, <line2>)

" nnoremap <leader>m :MarkChanged<cr>
" vnoremap <leader>m :MarkChanged<cr>
" nnoremap <leader>M :MarkUnchanged<cr>
" vnoremap <leader>M :MarkUnchanged<cr>

" }}}
" }}}
" }}}
nnoremap <silent> ,1 :call HiInterestingWord(1)<cr>
nnoremap <silent> ,2 :call HiInterestingWord(2)<cr>
nnoremap <silent> ,3 :call HiInterestingWord(3)<cr>
nnoremap <silent> ,4 :call HiInterestingWord(4)<cr>
nnoremap <silent> ,5 :call HiInterestingWord(5)<cr>
nnoremap <silent> ,6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#20B2AA ctermbg=14
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#9370DB ctermbg=13
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#FF6666 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#0070ff ctermbg=26

noremap <silent> ,<space> :noh<cr>:call clearmatches()<cr>

" }}}



autocmd BufRead,BufNewFile *.pet set filetype=json
autocmd BufRead,BufNewFile *mxml set filetype=xml
