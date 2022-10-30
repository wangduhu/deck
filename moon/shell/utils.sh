ec() {
    file=$1

    # check filepath is relative or absolute
    first_char=${file:0:1}
    if [[ ${first_char} != "~" ]] && [[ ${first_char} != "/" ]]; then
        file=${PWD}/${file}
    fi

    window=$2
    [[ "${window}x" == "x" ]] && window=1 # default one

    focus=winum-select-window-${window}

    eval="(progn (${focus}) (find-file \"${file}\"))"

    emacsclient -e "${eval}"
}
