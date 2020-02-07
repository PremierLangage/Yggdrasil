extends = /model/basic.pl

@ country_data.csv [data.csv]

title = QCM : Capitales de pays

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    all_rows=list(csv.DictReader(file,delimiter=','))
    
sample_rows=rd.sample(all_rows,4)

pays=sample_rows[0]['country']
article=sample_rows[0]['article']

radio.load_choices([row['capital'] for row in sample_rows])
radio.set_sol_by_index(0)
radio.shuffle()

partitif = {"le":"du ", "la":"de la ", "les":"des ", "l":"de l'"}
du_pays = partitif[article] + pays
==

text ==
Quelle est la capitale {{du_pays}} ?
==

radio =: RadioGroup

# Les deux lignes suivantes sont temporaires.
@ /utils/radiogroup.py [customradiogroup.py]
radio.decorator = CustomRadioGroup

form ==
{{ radio|component }}
==

evaluator ==
grade = radio.eval()
==


