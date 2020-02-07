extends = /template/basic.pl
@ /builder/before.py [builder.py]

@ country_data.csv [data.csv]

title = QCM : Capitales de pays

before ==
import random as rd
import csv

f = open('data.csv',newline='')
reader=csv.DictReader(f,delimiter=',')
items=rd.sample(list(reader),4)
f.close()

country=items[0]['country']
article=items[0]['article']
capitals=[item['capital'] for item in items]

radio.load_choices(capitals)
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

