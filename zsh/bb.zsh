

bb () {
    cd "$HOME/Bunchball/$1"
}

_bb () {
    ((CURRENT == 2)) && _files -/ -W $HOME/Bunchball
}
compdef _bb bb