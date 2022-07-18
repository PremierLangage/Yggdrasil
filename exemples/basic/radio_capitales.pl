extends = /model/basic.pl

@ pays_europe.csv

title = Capitales européennes (Radio)

radio =: RadioGroup
radio.decorator = CustomRadio

before ==
import random as rd
import csv

with open('pays_europe.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))
    
sample_rows=rd.sample(all_rows, 4)

pays = sample_rows[0]['pays']
article = sample_rows[0]['article']

radio.setitems([row['capitale'] for row in sample_rows])
radio.setsol_from_index(0)
radio.shuffle()

partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
du_pays = partitif[article] + pays
==

text ==
Quelle est la capitale {{ du_pays }} ?
==

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==



