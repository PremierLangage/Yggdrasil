extends = /template/basicinput.pl

@ grec_voc_1.csv [data.csv]

title = Capitales de pays

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=';'))

item=rd.choice(rows)
mot=" ".join(item['article'],item['mot'])
country=item['traductions'].split(",")
choices=[item['traductions'] for item in rows]

input.autocomplete = choices
==

text ==
Que signifie le mot suivant ?
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
Analyser la forme verbale suivante : 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{mot}}
</div><br>
==

evaluator ==
if input.value==country:
    grade=(100,"")
else:
    grade=(0,"")
==

