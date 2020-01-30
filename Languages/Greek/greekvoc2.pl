extends = /template/basicinput.pl

settings.feedback.class = colorbox

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
==

text ==
Que signifie le mot suivant ?
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{mot}}
</div>
==

evaluator ==
import random as rd

if nbwords>0:
    item=rd.choice(rows)
    mot=" ".join([item['article'],item['mot']])
    nbwords -= 1

if input.value==traduction:
    nbsuccess += 1
    grade=(100,str(nbsuccess))
else:
    grade=(0,str(nbsuccess))

input.value = ""
==

