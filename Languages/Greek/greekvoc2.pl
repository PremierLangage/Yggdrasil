@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
input =: Input

form ==
{{ input | component }}
==
settings.feedback.class = raw

@ grec_voc_1.csv [data.csv]

title = Vocabulaire grec

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
step=1
progress=20
==

bar ==
Que signifie le mot suivant ?

<div class="progress">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
  aria-valuemin="0" aria-valuemax="100" style="width:{{progress}}%">
    {{step}} / 5
  </div>
</div>
==

text ==
<div class="progress" style="width:50%">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
  aria-valuemin="0" aria-valuemax="100" style="width:{{progress}}%">
    {{step}} / 5
  </div>
</div>

Que signifie le mot suivant ?

<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{mot}}
</div>
==

evaluator ==
if input.value==lst_trad[step]:
    nbsuccess += 1
    grade=(100," ")
else:
    grade=(0," ")

if step<5:
    progress+=20
    step += 1
    mot=lst_mots[step]
    input.value = ""
else:
    form=""
==


