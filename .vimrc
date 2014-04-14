if exists('g:loaded_home')
  finish
endif
"
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
NeoBundle 'rjsh/rssv'
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
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'rhysd/conflict-marker.vim'
" NeoBundle 'klen/python-mode'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'marijnh/tern_for_vim', {
      \ 'build' : {
      \     'mac' : '/Users/robertshih/homebrew/bin/npm install',
      \     'unix' : 'npm install',
      \   },
      \ }
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh --clang-completer',
      \     'unix' : './install.sh --clang-completer',
      \   },
      \ }
filetype plugin indent on
NeoBundleCheck
"
set ai
" set autochdir
set completeopt-=preview
set expandtab
set fileencodings=utf-8
set hidden
set hls
set ignorecase
set laststatus=2
set nocompatible
set nu
set sessionoptions-=curdir
set shiftwidth=2
set smartcase
set splitbelow
set tabstop=2
set t_Co=16
set viewoptions=cursor ",folds,slash,unix
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
setglobal fenc=utf-8
syntax enable
"
let mapleader = " "
let g:cache_dir = '/Volumes/tmpfs/Caches/'
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
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
let g:easytags_cmd = '/Users/robertshih/homebrew/bin/ctags'
let g:easytags_languages = {
    \   'python': {
    \     'cmd': g:easytags_cmd,
    \       'args': ['--python-kinds=-iv'],
    \       'fileoutput_opt': '-f',
    \       'stdout_opt': '-f-',
    \       'recurse_flag': '-R'
    \    }
    \ }
let g:easytags_updatetime_min = 2000
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'
let g:user_emmet_expandabbr_key = '<c-y>e'
let g:tagbar_autoclose = 1
let g:tagbar_map_close = "<esc>"
let g:tagbar_ctags_bin = '/Users/robertshih/homebrew/bin/ctags'
let g:EasyMotion_mapping_j = '<leader><leader>k'
let g:EasyMotion_mapping_k = '<leader><leader>i'
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
let g:EasyMotion_mapping_t = 't'
let g:EasyMotion_mapping_T = 'T'
let g:ycm_confirm_extra_conf = 0
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
      \ 'break ', 'except ',  'in ',  'raise '],
      \ 'html' : [
      \ '@', '#', '$', '^', '*', '(', ')', '-', '=', '+', '[', ']', '{', '}',
      \ ':', '"', '.', '>', ' ']
      \ }
let g:airline_section_c = '%n:%t%m'
let g:airline#extensions#bufferline#enabled = 0
let g:loaded_home=1
"
au! BufNewFile,BufRead *tmux*conf set filetype=tmux.conf
"
command! CtrlPYankring call ctrlp#init(ctrlp#yankring#id())
command! CtrlPCmdline call ctrlp#init(ctrlp#cmdline#id())
"
python << EOF
from vim import command as vc, eval as ve, buffers as bs, current as cr
def bmap(f,n):
  bs[n][:] = map(f,bs[n])
def bfilter(f,n):
  bs[n][:] = filter(f,bs[n])
def bsub(f,n):
  bs[n][:] = f(bs[n])
EOF
"
fu! TogglePreview()
python << EOF
op = '-' if 'preview' in ve('&completeopt').split(',') else '+'
vc('set completeopt{op}=preview'.format(op=op))
EOF
endf
"
python << EOF
from string import printable
keynot={'\r': '<cr>','\n': '<cr>', '\t': '<tab>', ' ': '<space>', '|': '<bar>', '\x0b': '','\x0c': ''}
for ch in printable:
  ch=keynot.get(ch,ch)
  if ch:
    vc('silent nnoremap a{ch} a{ch}<esc>'.format(ch=ch))
    vc('silent nnoremap s{ch} i{ch}<esc>'.format(ch=ch))
EOF
"
function! PyRange(s,e)
  let m = join(getline(a:s,a:e),"\n")
  let c = join(["python << EOF", m, "EOF"],"\n")
  let @" = c
  @"
endfunction
"
function! PyLine(l)
python << EOF
from ast import parse, Expr
expr=lambda tree:str(int(len(tree.body)==1 and type(tree.body[0])==Expr))
vc('let l:s='+expr(parse(ve('a:l'))))
EOF
  if l:s
    exec 'py print repr('.a:l.')'
  else
    exec 'py '.a:l
  endif
endf
"
python << EOF
for (m,cmd) in [(m,cmd) for m in 'nv' for cmd in 'presfx']:
  fmt="autocmd Filetype gitrebase "\
      +"{m}noremap <leader>{cmd} "\
      +":{r}pydo return '{cmd} '+line.split(' ',1)[1]<cr>"
  vc(fmt.format(m=m,cmd=cmd,r='' if m=='v' else '.'))
EOF
"
fu! TmuxCopy()
python << EOF
from os import environ,unlink as rm
from sh import tmux
from tempfile import NamedTemporaryFile as tmp
try:
  _=environ['TMUX']
  t=tmp(delete=False)
  t.close()
  for i in xrange(18,-1,-1):
    tmux('saveb -b {i} {p}'.format(i=i  ,p=t.name).split())
    tmux('loadb -b {j} {p}'.format(j=i+1,p=t.name).split())
  r0=ve('@0')
  tmux('setb -b 0'.split()+[r0])
except:
  pass
EOF
endf
"
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
"
noremap h i
noremap i k
noremap j h
noremap k j
"
nnoremap ; :
nnoremap : ;
nnoremap <c-i> <c-o>
nnoremap <c-o> <c-i>
nnoremap <cr> o<esc>
nnoremap <leader>1 <c-w>o
nnoremap <leader>b :echo bufferline#get_echo_string()<cr>
nnoremap <leader>] <c-]>
nnoremap <leader><c-p> :.!python -i 2>/dev/null<cr>
nnoremap <leader><cr> O<esc>
nnoremap <leader>[ <c-t>
nnoremap <leader>. :CtrlPGt <cr>
nnoremap <leader>e :CtrlPBuffer <cr>
nnoremap <leader>f :CtrlPPymp <cr>
nnoremap <leader>gf :vertical wincmd f<cr>
nnoremap <leader>gF :vertical wincmd F<cr>
nnoremap <leader>i <c-w>k
nnoremap <leader>I <c-w>k<c-w>_
nnoremap <leader>j <c-w>h
nnoremap <leader>k <c-w>j
nnoremap <leader>K <c-w>j<c-w>_
nnoremap <leader>l <c-w>l
nnoremap <leader><leader>p :call PyRange(1,"$")<cr>
nnoremap <leader><leader>s :%y<cr>:@"<cr>
nnoremap <leader>m :CtrlPMRUFiles <cr>
nnoremap <leader>M <c-w>_
nnoremap <leader>n :bn<cr>
nnoremap <leader>N :bN<cr>
nnoremap <leader>O :CtrlPBufTag <cr>
nnoremap <leader>o :TagbarToggle<cr>
nnoremap <leader>p :call PyLine(getline("."))<cr>
nnoremap <leader>q <c-w>q
nnoremap <leader>r :CtrlPCmdline <cr>
nnoremap <leader>R :CtrlP <cr>
nnoremap <leader>s yy:@"<cr>
nnoremap <leader>/ :TagbarOpen<cr>/
nnoremap <leader>t :CtrlPTag <cr>
nnoremap <leader>v "*p
nnoremap <leader>y :CtrlPYankring <cr>
nnoremap <leader>. :YcmCompleter GoToDefinition<cr>
"
vnoremap ; :
vnoremap : ;
vnoremap <cr> y:let @*=@"<cr>
vnoremap <leader>p <esc>:call PyRange("'<","'>")<cr>
vnoremap <leader>s :y<cr>:@"<cr>
vnoremap gx :normal gx<cr>
"
cnoremap <c-a> <home>
cnoremap <esc>b <s-left>
cnoremap <esc>f <s-right>
"
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <f2> <esc>:call TogglePreview()<cr>a
"
autocmd Filetype javascript nnoremap <buffer> <leader>. :TernDef<cr>
autocmd Filetype javascript nnoremap <buffer> <leader>; :TernRefs<cr>
autocmd Filetype javascript nnoremap <buffer> <leader><leader>f :%!/Users/robertshih/homebrew/bin/js-beautify -<cr>
"
if filereadable(".vimrc")
  source .vimrc
endif
