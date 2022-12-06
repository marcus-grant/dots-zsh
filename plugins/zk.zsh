ZK_DIR=$HOME/Documents/notes

alias fzk="zk list -i -W $ZK_DIR"

function fzke() {
    echo $(zk list -i -W $ZK_DIR | sed -n 's/(.*)\.md/\1/p')
}

function zkn() {
    storepath
    cd $ZK_DIR
    nvim
    recalpath
}
