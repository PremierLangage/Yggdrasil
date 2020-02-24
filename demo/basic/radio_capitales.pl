extends = /model/basic.pl

@ pays_europe.csv

title = Capitales européennes (Radio)

before ==
import random as rd
import csv

with open('pays_europe.csv',newline='') as file:
    all_rows = list(csv.DictReader(file,delimiter=','))
    
sample_rows=rd.sample(all_rows,4)

pays = sample_rows[0]['pays']
article = sample_rows[0]['article']

radio.loaditems([row['capitale'] for row in sample_rows])
radio.setsol_index(0)
radio.sort()

partitif = {"le":"du ", "la":"de la ", "les":"des ", "l":"de l'"}
du_pays = partitif[article] + pays
==

text ==
Quelle est la capitale {{du_pays}} ?
==

radio =: RadioGroup

# Les deux lignes suivantes sont temporaires.
@ /utils/components/radio.py [customradio.py]
radio.decorator = CustomRadio

form ==
{{ radio|component }}
==

evaluator ==
grade = radio.eval()
==
