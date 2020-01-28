@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data2.csv [data.csv]

title = Capitales de pays

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

item=rd.choice(rows)
country=item['country']
article=item['article']
capital=item['capital']

partitif={"le":"du ","la":"de la ","les":"des ","l":"de l'"}
ofcountry = partitif[article] + country
==

text ==
Quelle est la capitale {{ofcountry}} ?
==

theinput =: Input
theinput.type = text

form ==
{{ theinput | component }}
==

evaluator ==

essai+=1

if theinput.value==capital:
    grade=(100,"Bravo !")
else:
    if essai >3:
        exec(before)
    grade=(0,"essai="+str(essai)+"<br>Raté !")

==






