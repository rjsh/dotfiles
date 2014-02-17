autoload -U compinit promptinit
setopt NO_BEEP
unsetopt ignoreeof
WORDCHARS='*?_-.~=&!#$%^(){}<>'
#
compinit 
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _oldlist _complete
#
. ~/.zsh/antigen/antigen.zsh
. ~/.zsh/conf/auto-fu.zsh
. ~/.zsh/conf/history.zsh
. ~/.zsh/conf/aliases.zsh
#
if which fasd > /dev/null; then eval "$(fasd --init auto)"; fi
#
promptinit
antigen bundle rjsh/pure # prompt pure
antigen bundle hchbaw/auto-fu.zsh
#
bindkey -e
bindkey -M afu '^@' auto-fu-toggle
bindkey -M afu '^D' afu+orf-exit-deletechar-list 
bindkey -M afu '^U' backward-kill-line
bindkey -M afu '^[[Z' reverse-menu-complete
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey -M afu   "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey -M afu   "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey -M afu   "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey -M afu   "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey -M afu   "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey -M afu   "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey -M afu   "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey -M afu   "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey -M afu   "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey -M afu   "${key[PageDown]}" end-of-buffer-or-history

zle-line-init () {
  auto-fu-init;
}
zle -N zle-line-init
