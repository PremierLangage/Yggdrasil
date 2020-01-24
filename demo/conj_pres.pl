@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator2.py [grader.py]

@ conj_data.csv [data.csv]

title = Conjugaison

before ==

import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

row=rd.choice(rows)
p=rd.choice(['1S','2S','3S','1P','2P','3P'])

dic_txt_prs={'1S':'1ère personne du singulier',
             '2S':'2e personne du singulier',
             '3S':'3e personne du singulier',
             '1P':'1ère personne du pluriel',
             '2P':'2e personne du pluriel',
             '3P':'3e personne du pluriel'}

verbe_inf=row['infinitif']
verbe_conj=row[p]
txt_prs=dic_txt_prs[p]

==

text ==
Conjuguer le verbe {{verbe_inf}} à la {{txt_prs}} du présent.
==

input =: Input

form ==
<div class="d-flex align-items-center">
  <div>Flex item</div>
  <div class="flex-grow-1">{{input|component}}</div>
</div>
==

evaluator ==
if input.value==verbe_conj:
    grade=(100,"")
else:
    grade=(0,"")
==



