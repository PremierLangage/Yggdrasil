@ /utils/sandboxio.py
@ /builder/before3.py [builder.py]
@ /grader/evaluator3.py [grader.py]
input =: Input

form ==
{{ input | component }}
==
settings.feedback.class = raw

@ grec_voc_1.csv [data.csv]

title =

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=';'))

choices=[item['traductions'] for item in rows]
input.autocomplete = choices

selection=rd.sample(rows,5)
lst_mots=[item['article']+" "+item['mot'] for item in selection]
lst_trad=[item['traductions'] for item in selection]

mot=lst_mots[0]
nbsuccess=0
==

settings.repetition % 5

text ==
Que signifie le mot suivant ?

<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{mot}}
</div>
==

inter ==
if input.value==lst_trad[step]:
    nbsuccess += 1

mot=lst_mots[step+1]
input.value = ""
==

evaluator ==
form=""
feedback=str(
==



