extends = /template/basic.pl
@ /builder/before.py [builder.py]

@ country_data.csv [data.csv]

title = QCM : Capitales de pays

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    all_rows=list(csv.DictReader(file,delimiter=','))
    
sample_rows=rd.sample(all_rows,4)

country=sample_rows[0]['country']
article=sample_rows[0]['article']

radio.load_choices([row['capital'] for row in sample_rows])
radio.set_sol_by_index(0)
radio.shuffle()

if article=="le":
    ofcountry = "du " + country
elif article=="l":
    ofcountry = "de l'" + country
elif article=="la":
    ofcountry = "de la " + country
elif article=="les":
    ofcountry = "des " + country
==

text ==
Quelle est la capitale {{ofcountry}} ?
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

