set nocompatible               " be iMproved
filetype off                   " required!

source ~/.vim/bundles.vim

filetype plugin indent on     " required by vundle



""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""
set number
set mouse=a
syntax enable
set background=dark
colorscheme Tomorrow-Night
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"set t_Co=256 " Explicitly tell vim that the terminal supports 256 color
set term=screen-256color
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"let g:Powerline_symbols = 'fancy'
set guifont=h14
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$' ]
set backspace=indent,eol,start

"set clipboard=unnamed " for adding cliboard to unnamed register (system)
" https://coderwall.com/p/j9wnfw

"For the nice looking powerline symbols to appear

" autocmd BufEnter * :syntax sync fromstart


""""
" vim-airline
""""

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""""  
" jedi-vim
""""

autocmd FileType python setlocal completeopt-=preview " To disable doc window

"""""
" EasyTags
let g:easytags_python_enabled = 0
set tags=./.tags;
let g:easytags_dynamic_files = 2
"""create a local tags file

""" Ctrl+P
set wildignore+=*.pyc




"" TabMan
""   Press <leader>mt or run :TMToggle to toggle TabMan.
""     Press <leader>mf or run :TMFocus to give focus to/open the TabMan
let g:tabman_side = 'right'

""" TagBar
map <leader>t :TagbarToggle<CR>
""""
"NerdTreeTabs
"""


autocmd vimenter * if !argc() | let g:nerdtree_tabs_open_on_console_startup = 1 | endif

"""""""
" Clever tab
"
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


""""""""
" Relative number
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
""

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"""""
"" Vim conf reload
""""
augroup reload_vimrc " {
   autocmd!
   autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


""""
" Spell check
"""""
" Spell Check
let b:myLang=0
let g:myLangList=["nospell","fr","en"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F7> :call ToggleSpell()<CR>

 
" Set region to British English
set spelllang=en


" automatically leave insert mode after 'updatetime' milliseconds of inaction
"au CursorHoldI * stopinsert
"""""""
"Mapping
"
" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <leader>s :set spell!<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>


"""""
" Move line Up and down
"
"The following mappings in your vimrc provide a quick way to move lines 
"of text up or down. The mappings work in normal, insert and visual modes,
"allowing you to move the current line, or a selected block of lines.

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

"In normal mode or in insert mode, press Alt-j to move the current line 
"down, or press Alt-k to move the current line up.

"After visually selecting a block of lines
" (for example, by pressing V then moving the cursor down), 
" press Alt-j to move the whole block down, 
" or press Alt-k to move the block up. 

"""""""
" TagBar ctags
"
let g:ctrlp_extensions = ['tag']

"""""""
"Vim Javascript
""""
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"let g:neocomplcache_enable_at_startup = 1
"if !exists('g:neocomplcache_omni_functions')
"    let g:neocomplcache_omni_functions = {}
"endif
"let g:neocomplcache_omni_functions['python'] = 'jedi#complete'
"let g:jedi#popup_on_dot = 0


autocmd BufNewFile,BufRead *.less setlocal ft=css
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.jinja2, *.tmpl set ft=jinja
autocmd BufNewFile,BufRead *.tmpl setlocal ts=2
autocmd BufNewFile,BufRead *.tmpl setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.tmpl setlocal wm=2
autocmd BufNewFile,BufRead *.html setlocal ts=2
autocmd BufNewFile,BufRead *.html setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.html setlocal wm=2
autocmd BufNewFile,BufRead *.jinja setlocal ts=2
autocmd BufNewFile,BufRead *.jinja setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.jinja setlocal wm=2
autocmd BufNewFile,BufRead *.jinja2 setlocal ts=2
autocmd BufNewFile,BufRead *.jinja2 setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.jinja2 setlocal wm=2
autocmd BufNewFile,BufRead *.js setlocal expandtab
autocmd BufNewFile,BufRead *.js setlocal ts=2
autocmd BufNewFile,BufRead *.js setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.js setlocal wm=2
autocmd BufNewFile,BufRead *.css setlocal expandtab
autocmd BufNewFile,BufRead *.css setlocal ts=4
autocmd BufNewFile,BufRead *.css setlocal shiftwidth=4
autocmd BufNewFile,BufRead *.css setlocal wm=4
autocmd BufNewFile,BufRead *.cfg setlocal expandtab
autocmd BufNewFile,BufRead *.cfg setlocal ts=4
autocmd BufNewFile,BufRead *.cfg setlocal shiftwidth=4
autocmd BufNewFile,BufRead *.cfg setlocal wm=4


:au FocusLost * silent! wa
:set autowrite
:set hlsearch
:set incsearch

