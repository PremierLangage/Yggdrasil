@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

@ pays_europe.csv

title = Capitales d'Europe

before ==
import random as rd
import csv

with open('pays_europe.csv',newline='') as file:
    all_rows=list(csv.DictReader(file,delimiter=','))
    
row=rd.choice(all_rows)

pays=row['country']
article=row['article']

partitif = {"le":"du ", "la":"de la ", "les":"des ", "l":"de l'"}
du_pays = partitif[article] + pays
==

text ==
Quelle est la capitale {{du_pays}} ?
==

input =: Input

form ==
{{ input | component }}
==

evaluator ==
if input.value == capital:
    grade = (100,"")
else:
    grade = (0,"")
==

