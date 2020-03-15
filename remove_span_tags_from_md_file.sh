
# removes <span class="hlb">SomeText</span> tags around SomeText and 
# replaces <pre> and </pre> tags with ```.
cat SSL-certificate.md | perl -wpl -e 's!\<span class=\".+?"\>(.+?)\</span\>!$1!g' | perl -wpl -e 's!\<pre\>|\</pre\>!```!g'  > SSL-certificate.md.new
