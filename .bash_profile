export GOPATH="$HOME/code/go";
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/qt5/bin:$GOPATH/bin:$PATH";
export EDITOR='vim';

_tmuxinator() {
    COMPREPLY=()
    local word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        local commands="$(compgen -W "$(tmuxinator commands)" -- "$word")"
        local projects="$(compgen -W "$(tmuxinator completions start)" -- "$word")"

        COMPREPLY=( $commands $projects )
    else
        local words=("${COMP_WORDS[@]}")
        unset words[0]
        unset words[$COMP_CWORD]
        local completions=$(tmuxinator completions "${words[@]}")
        COMPREPLY=( $(compgen -W "$completions" -- "$word") )
    fi
}

complete -F _tmuxinator tmuxinator mux

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
