@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

@ country_data2.csv [data.csv]

title = Capitales d'Europe

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

item = rd.choice(rows)
pays = item['pays']
article = item['article']
capitale = item['capitale']

partitif = {"le":"du ", "la":"de la ", "les":"des ", "l":"de l'"}
dupays = partitif[article] + country
==

text ==
Quelle est la capitale {{ofcountry}} ?
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
