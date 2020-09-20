extends = /model/basic/input.pl

@ grec_voc_1.csv [data.csv]

title = Vocabulaire grec

input =: Input

form ==
{{ input | component }}
==


before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=';'))

# choices=[item['traductions'] for item in rows]
# input.autocomplete = choices
==

text ==
Que signifie le mot suivant ?
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{article}} {{mot}}
</div>
==

sol ==
{{traductions}}
==




