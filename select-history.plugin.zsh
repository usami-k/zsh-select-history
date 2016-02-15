if which peco >/dev/null ; then
    function peco-select-history() {
        local tac
        if which gtac >/dev/null ; then
            tac="gtac"
        elif which tac >/dev/null ; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }

    zle -N peco-select-history
    bindkey '^R' peco-select-history
fi
