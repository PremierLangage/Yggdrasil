extends = /model/basic/input.pl

@ conj_data.csv

title = Conjugaison

before ==
import random as rd
import csv

with open('conj_data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

row=rd.choice(rows)
p=rd.choice(['1S','2S','3S','1P','2P','3P'])

dic_pronom={'1S':'je','2S':'tu','3S':'il','1P':'nous','2P':'vous','3P':'ils'}

verbe_inf=row['infinitif']
verbe_conj=row[p]
pronom=dic_pronom[p]
==

text ==
Conjuguer le verbe **{{verbe_inf}}** au présent avec le pronom indiqué.
==

form ==
<div class="d-flex align-items-center">
  <div class="align-self-top">{{pronom}} &nbsp; </div>
  <div class="flex-grow-1">{{input|component}}</div>
</div>
==

solution ==

==

input.prefix = 3

evaluator ==
if input.value==verbe_conj:
    grade=(100,"")
else:
    grade=(0,"")
==








