# path, the 0 in the filename causes this to load first

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$1:$PATH
  fi
}

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

# Brew python at top of $PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
pathAppend="/usr/local/bin"

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec

pathAppend "$HOME/.ops/bin"
pathAppend "$HOME/.yadr/bin"
pathAppend "$HOME/.yadr/bin/yadr"
pathAppend "$GOPATH"
pathAppend "$GOROOT"
pathAppend "node_modules/.bin"
pathAppend "/usr/local/opt/openssl/bin"

# pathAppend "/usr/local/opt/python/libexec/bin"
pathAppend "$HOME/.jenv/bin"


eval "$(jenv init -)"
