extends = /template/radio.pl

@ country_data.csv [data.csv]

title = QCM : Capitales de pays
before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
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



