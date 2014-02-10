path=(/Library/Frameworks/OpenVPN.framework/Versions/Current/bin $HOME/homebrew/bin $HOME/bin $path)
fpath=($HOME/.zsh/functions $(brew --prefix)/share/zsh-completions $(brew --prefix)/share/zsh/site-functions $fpath)

export HOMEBREW_NO_EMOJI=1
export HOMEBREW_CACHE=/Volumes/tmpfs/Caches/Homebrew
export HOMEBREW_TEMP=/Volumes/tmpfs
export LOCATE_PATH=/Volumes/tmpfs/Caches/locate.database
export LC_ITERM_PROFILE=$ITERM_PROFILE
export EDITOR=/Users/robertshih/homebrew/bin/vim
