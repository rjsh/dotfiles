if exists('g:loaded_home')
  finish
endif
"
set nu
set ai
set ignorecase
set smartcase
noremap j h
noremap k j
noremap h i
noremap i k
set hidden
"
set tabstop=2
set shiftwidth=2
set expandtab
"
let mapleader = " "
nnoremap <leader>] <c-]>
nnoremap <leader>[ <c-t>
"
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
"
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'rjsh/pymp.vim'
NeoBundle 'rjsh/gt.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'restore_view.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'Wombat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh --clang-completer',
      \     'unix' : './install.sh --clang-completer',
      \   },
      \ }
filetype plugin indent on
NeoBundleCheck
"
let g:cache_dir = '/dev/shm'
"
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("j")':   ['<c-k>', '<down>'],
      \ 'PrtSelectMove("k")':   ['<c-i>', '<up>'],
      \ 'AcceptSelection("t")': ['<c-j>'],
      \ }
let g:ctrlp_extensions = ['gt', 'yankring', 'cmdline', 'pymp']
let g:ctrlp_show_hidden = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = g:cache_dir.'ctrlp'
nnoremap <leader>R :CtrlP <cr>
nnoremap <leader>e :CtrlPBuffer <cr>
nnoremap <leader>O :CtrlPBufTag <cr>
nnoremap <leader>m :CtrlPMRUFiles <cr>
nnoremap <leader>t :CtrlPTag <cr>
nnoremap <leader>. :CtrlPGt <cr>
command! CtrlPYankring call ctrlp#init(ctrlp#yankring#id())
nnoremap <leader>y :CtrlPYankring <cr>
command! CtrlPCmdline call ctrlp#init(ctrlp#cmdline#id())
nnoremap <leader>r :CtrlPCmdline <cr>
nnoremap <leader>f :CtrlPPymp <cr>
"
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
let g:easytags_updatetime_min = 2000
"
au! BufNewFile,BufRead *tmux*conf set filetype=tmux.conf
"
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
"
let g:tagbar_autoclose = 1
nnoremap <leader>o :TagbarToggle<cr>
nnoremap <leader>/ :TagbarOpen<cr>/
let g:tagbar_map_close = "<esc>"
let g:tagbar_ctags_bin = '/usr/bin/ctags'
"
nnoremap <leader>s yy:@"<cr>
nnoremap <leader><leader>s :%y<cr>:@"<cr>
vnoremap <leader>s :y<cr>:@"<cr>
"
nnoremap <cr> o<esc>
nnoremap <leader><cr> O<esc>
"
nnoremap <leader>i <c-w>k
nnoremap <leader>j <c-w>h
nnoremap <leader>k <c-w>j
nnoremap <leader>l <c-w>l
nnoremap <leader>q <c-w>q
nnoremap <leader>1 <c-w>o
nnoremap <leader>M <c-w>_
nnoremap <leader>I <c-w>k<c-w>_
nnoremap <leader>K <c-w>j<c-w>_
"
python << EOF
from vim import command as c
from string import printable
keynot={'\r': '<cr>','\n': '<cr>', '\t': '<tab>', ' ': '<space>', '|': '<bar>', '\x0b': '','\x0c': ''}
for ch in printable:
  ch=keynot.get(ch,ch)
  if ch:
    c('silent nnoremap a{ch} a{ch}<esc>'.format(ch=ch))
    c('silent nnoremap s{ch} i{ch}<esc>'.format(ch=ch))
EOF
"
cnoremap <c-a> <home>
cnoremap <esc>b <s-left>
cnoremap <esc>f <s-right>
inoremap <c-a> <home>
inoremap <c-e> <end>
"inoremap <esc>b <s-left>
"inoremap <esc>f <s-right>
"
let g:EasyMotion_mapping_j = '<leader><leader>k'
let g:EasyMotion_mapping_k = '<leader><leader>i'
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
let g:EasyMotion_mapping_t = 't'
let g:EasyMotion_mapping_T = 'T'
"
set splitbelow
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
      \ 'python' : [
      \ '+', '-', '*', '/',
      \ '%', '<',  '>', '&', '|', '~', '^',
      \ '(', '[', '{', '.', ',', ':', ';', '@', '=',
      \ 'False ', 'class ',  'finally ',  'is ',  'return ',
      \ 'None ', 'continue ',  'for ',  'lambda ',  'try ',
      \ 'True ', 'def ',  'from ',  'nonlocal ',  'while ',
      \ 'and ', 'del ',  'global ',  'not ',  'with ',
      \ 'as ', 'elif ',  'if ',  'or ',  'yield ',
      \ 'assert ', 'else ',  'import ',  'pass ',
      \ 'break ', 'except ',  'in ',  'raise ']
      \ }
"
fu! TogglePreview()
python << EOF
from vim import eval as e, command as c
op = '-' if 'preview' in e('&completeopt').split(',') else '+'
c('set completeopt{op}=preview'.format(op=op))
EOF
endf
inoremap <f2> <esc>:call TogglePreview()<cr>a
set viewoptions=cursor ",folds,slash,unix
set sessionoptions-=curdir
set laststatus=2
"
set t_Co=16
syntax enable
if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
  let g:iterm_profile=''
  if exists("$ITERM_PROFILE")
    let g:iterm_profile=expand("$ITERM_PROFILE")
  elseif exists("$LC_ITERM_PROFILE") 
    let g:iterm_profile=expand("$LC_ITERM_PROFILE")
  endif

  if g:iterm_profile=='Default'
    let g:airline_theme="dark"
  elseif g:iterm_profile=='Visor'
    "let g:airline_powerline_fonts=1
    colorscheme wombat
    let g:airline_theme="wombat"
  elseif g:iterm_profile=='tmux'
    colorscheme solarized
    let g:airline_theme="solarized"
  elseif g:iterm_profile=='DTerm'
    colorscheme base16-greenscreen
    let g:airline_theme="luna"
  endif
endif

let g:airline_section_c = '%n:%t%m'
let g:airline#extensions#bufferline#enabled = 0
"
"
function! PyRange(s,e)
  let m = join(getline(a:s,a:e),"\n")
  let c = join(["python << EOF", m, "EOF"],"\n")
  let @" = c
  @"
endfunction
python << EOF 
from vim import command as c, eval as e, buffers as bs, current as cr
def bmap(f,n):
  bs[n][:] = map(f,bs[n])
def bfilter(f,n):
  bs[n][:] = filter(f,bs[n])
def bsub(f,n):
  bs[n][:] = f(bs[n])
EOF 

function! PyLine(l)
python << EOF
from ast import parse, Expr
expr=lambda tree:str(int(len(tree.body)==1 and type(tree.body[0])==Expr))
c('let l:s='+expr(parse(e('a:l'))))
EOF
  if l:s
    exec 'py print repr('.a:l.')'
  else
    exec 'py '.a:l
  endif
endf
nnoremap <leader>p :call PyLine(getline("."))<cr>
nnoremap <leader><leader>p :call PyRange(1,"$")<cr>
vnoremap <leader>p <esc>:call PyRange("'<","'>")<cr>
"
vnoremap <cr> y:let @*=@"<cr>
nnoremap <leader>v "*p
"
set wildmenu
set wildmode=longest:full,full
" set wildcharm=<c-z>
" cnoremap <space> <space><c-z>
" python << EOF
" from string import ascii_lowercase as low
" for a in low+'./':
"   c('cnoremap {k} {k}<c-z><c-z>'.format(k=a))
" EOF
"
setglobal fenc=utf-8
set fileencodings=utf-8
"
nnoremap <leader>n :bn<cr>
nnoremap <leader>N :bN<cr>
nnoremap <leader>b :echo bufferline#get_echo_string()<cr>
"
set virtualedit=block
set hls
"
nnoremap <leader>gf :vertical wincmd f<cr>
nnoremap <leader>gF :vertical wincmd F<cr>
"
nnoremap <c-o> <c-i>
nnoremap <c-i> <c-o>
"
nnoremap <leader><c-p> :.!python -i 2>/dev/null<cr>
"
let g:loaded_home=1
if filereadable(".vimrc")
  source .vimrc
endif
