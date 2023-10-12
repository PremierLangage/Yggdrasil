extends = /model/basic.pl

@ pays_europe.csv

title = Capitales européennes

before ==
import random as rd
import csv

with open('pays_europe.csv',newline='') as file:
    all_rows = list(csv.DictReader(file,delimiter=','))
    
row = rd.choice(all_rows)

pays = row['pays']
article = row['article']
capitale = row['capitale']

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

settings.feedback = rightwrong

evaluator ==
if input.value == capitale:
    grade = (100,"")
else:
    grade = (0, capitale)
==




