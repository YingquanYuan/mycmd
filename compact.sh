#!/bin/bash

# supported language
suffices=("java" "c" "h" "cpp" "js" "css" "jsp" "rkt" "sql" "xml" "py" "rb" "sh")
pattern='^\s*\/\*|^\s*\*|^\s*\/\/|^\s*;|^\s*--|^\s*#'

if [ $# -lt 1 ]; then
cat<<HELP
    lines -- count the number of lines of uncommented codes in a sequence of source files.

    USAGE: ./lines file1 file2 ... filen
HELP
    exit 0
fi

for file in $*; do
    if [ -f "$file" ]; then
        suffix="${file##*.}"
        if [[ ${suffices[@]} =~ $suffix ]]; then
            grep -Ev $pattern ${file} | grep '[[:graph:]]' -
        else
            echo "$file: unsupported file type"
        fi
    fi
done
