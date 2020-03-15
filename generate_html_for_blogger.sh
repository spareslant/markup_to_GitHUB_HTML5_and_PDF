#! /bin/bash

[[ $1 == "" ]] && echo "pass a html filename as first argument" && exit 2

#output_file="output.html"
input_file="$1"
output_file="$(basename $input_file .md).html"
output_file_code_tag_removed="$(basename $input_file .md).code_tag_removed.html"

pandoc "$input_file" -f markdown --template pandoc-goodies/templates/html5/github/GitHub.html5 --self-contained --toc --toc-depth=6 -o $output_file

cat "$output_file" | perl -wpl -e 's!\<code\>(.+?)\</code\>!\<span class=\"code"\>$1\</span\>!g' > "$output_file_code_tag_removed"
echo "file geneated: $output_file_code_tag_removed"
