extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

nbstep % 4
settings.cumulative % false

before == #|python|
import random as rd
import csv
from customradio import CustomRadio

with open('pays_europe.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

radios = []
texts = []
forms = []
evaluators = []
for i in range(nbstep):

    sample_rows=rd.sample(all_rows, 4)

    pays = sample_rows[0]['pays']
    article = sample_rows[0]['article']

    radios.append(CustomRadio())
    radios[i].setitems([row['capitale'] for row in sample_rows])
    radios[i].setsol_from_index(0)
    radios[i].shuffle()

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    
    texts.append(
        f"Quelle est la capitale {partitif[article]}  {pays} ?"
        )
    forms.append("{{ radios[step]|component }}")
    evaluators.append("score = radios[step].eval()")
==

intro ==
Ce quiz contient {{nbstep}} questions.
==
