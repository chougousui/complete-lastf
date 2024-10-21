# Autocomplete function
_autocomplete_lastf() {
    # Get the last argument
    local last_arg=$(echo $BUFFER | awk '{print $NF}')

    if [[ $last_arg =~ ^lastf([0-9]*)$ ]]; then
        # match is the result of the string matching above
        # match[0] stores the complete string, match[1] stores the first group, which is the numeric part
        # :- is the syntax for setting a default value
        local num_files=${match[1]:-1}

        # Get the last modified num_files files, separated by spaces
        # local last_file=$(\ls -1th -b | head -n1)
        local last_files=$(eza -1 -f --sort=modified --reverse | head -n $num_files | paste -sd ' ')

        # Replace 'lastfN' with the list of the last modified files
        BUFFER="${BUFFER%$last_arg}${last_files}"
        # Move the cursor to the end of the line
        CURSOR=${#BUFFER}

        # Return early, do not call expand-or-complete
        return 0

    elif [[ $last_arg =~ ^lastd([0-9]*)$ ]]; then
        local num_dirs=${match[1]:-1}

        # Get the last modified num_dirs directories, separated by spaces
        local last_dirs=$(eza -1 -D --sort=modified --reverse | head -n $num_dirs | paste -sd ' ')

        # Replace 'lastdN' with the list of the last modified directories
        BUFFER="${BUFFER%$last_arg}${last_dirs}"
        CURSOR=${#BUFFER}

        return 0
    fi

    # Call another widget to perform the default completion behavior
    zle expand-or-complete
}

# Bind the function to zle
zle -N _autocomplete_lastf

# Bind the Tab key to the custom autocomplete function
bindkey '^I' _autocomplete_lastf
