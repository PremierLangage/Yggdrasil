extends = /model/basic/input.pl

@ grec_voc_1.csv [data.csv]

delimiter = ;

title = Vocabulaire grec

before ==
# choices=[item['traductions'] for item in rows]
# input.autocomplete = choices
all_rows
==

text ==
Que signifie le mot suivant ?
{{article}} {{mot}}
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{article}} {{mot}}
</div>
==

sol ==
{{traductions}}
==




