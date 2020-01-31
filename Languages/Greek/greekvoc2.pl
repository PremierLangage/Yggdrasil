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


items=rd.sample(rows,5)
mot=" ".join([items[0]['article'],items[0]['mot']])
traduction=items[0]['traductions']


nbsuccess=0
step=1
progress=20
==

text ==
<div class="progress">
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
import random as rd

if input.value==traduction:
    nbsuccess += 1
    grade=(100,str(nbsuccess))
else:
    grade=(0,str(nbsuccess))

if step<5:
    progress+=20
    mot=" ".join([items[step]['article'],items[step]['mot']])
    traduction=items[step]['traductions']
    step += 1
    input.value = ""
else:
    form=""
==

