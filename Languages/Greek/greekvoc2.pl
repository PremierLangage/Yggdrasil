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

item=rd.choice(rows)
mot=" ".join([item['article'],item['mot']])
traduction=item['traductions']
choices=[item['traductions'] for item in rows]

input.autocomplete = choices

nbsuccess=0
nbwords=5
progress=0
==

text ==
<div class="progress">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
  aria-valuemin="0" aria-valuemax="100" style="width:{{progress}}%">
    50% Complete (info)
  </div>
</div>

Que signifie le mot suivant ?
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{mot}}
</div>
==

evaluator ==
import random as rd

if input.value==traduction:
    nbsuccess += 1
    grade=(100,str(nbsuccess))
else:
    grade=(0,str(nbsuccess))

if nbwords>0:
    progress+=20
    item=rd.choice(rows)
    mot=" ".join([item['article'],item['mot']])
    traduction=item['traductions']
    nbwords -= 1

input.value = ""
==

