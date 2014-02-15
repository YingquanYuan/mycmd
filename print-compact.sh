#!/bin/sh
# temporarily supported language
java="java"
c="c"
h="h"
cpp="cpp"
js="js"
css="css"
jsp="jsp"
racket="rkt"
sql="sql"
xml="xml"
# temporarily supported language

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
		if [ "$suffix" = "$java" -o "$suffix" = "$c" -o "$suffix" = "$h" -o "$suffix" = "$cpp" -o "$suffix" = "$js" -o "$suffix" = "$css" -o "$suffix" = "$jsp" -o "$suffix" = "$racket" -o "$suffix" = "$sql" -o "$suffix" = "$xml" ]; then
			filename="$file"
			grep -Ev '^\s{0,}\/\*|^\s{0,}\*|^\s{0,}\/\/|^\s{0,};|^--' ${filename} | grep -n '[[:graph:]]' -
		else
			echo "$file : unsupported language"
		fi
	fi
done


# prblematic '^\/\*|^[[:space:]]\*|^(+[[:blank:]])\*|^(+[[:space:]])\/\*|^\/\/'
# correct but redundant '^\/\*|^[[:space:]]\*|^\s{1,}\*|^(+[[:space:]])\/\*|^\/\/'
# good '^\s{0,}\/\*|^\s{0,}\*|^\s{0,}\/\/'

