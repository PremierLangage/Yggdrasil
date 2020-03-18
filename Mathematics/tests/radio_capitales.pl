extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

@ /utils/components/radio.py [customradio.py]

nbstep % 3

before ==
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
    globals()[f"radio{i}"] = CustomRadio()

    sample_rows=rd.sample(all_rows, 4)

    pays = sample_rows[0]['pays']
    article = sample_rows[0]['article']

    globals()[f"radio{i}"].setitems([row['capitale'] for row in sample_rows])
    globals()[f"radio{i}"].setsol_from_index(0)
    globals()[f"radio{i}"].shuffle()
    radios.append({"cid": globals()[f"radio{i}"].cid, "selector": globals()[f"radio{i}"].selector})

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    texts.append(f"Quelle est la capitale {partitif[article]}  {pays} ?")
    forms.append("""{{ radios[step]|component }}""")
    evaluators.append("""globals()[f"radio{step}"].eval()""")
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

