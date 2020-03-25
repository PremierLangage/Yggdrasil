extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

nbstep % 3
settings.cumulative % false
settings.repeat % false

before == #|python|
import random as rd
import csv
from customradio import CustomRadio

with open('pays_europe.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

radios = []

du_pays = []
partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}

pays_prec = []
for i in range(nbstep):

    while True:
        sample_rows=rd.sample(all_rows, 4)
        pays = sample_rows[0]['pays']
        if pays not in pays_prec:
            pays_prec.append(pays)
            break

    article = sample_rows[0]['article']
    du_pays.append(partitif[article]+pays)

    radios.append(CustomRadio())
    radios[i].setitems([row['capitale'] for row in sample_rows])
    radios[i].setsol_from_index(0)
    radios[i].shuffle()
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
Quelle est la capitale {{ du_pays[step] }} ?
==

formstep ==
{{ radios[step]|component }}
==

evaluatorstep ==
score = radios[step].eval()
==

