extends = /template/radio.pl

title = Question à choix multiples (radio)

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,5)
country=items[0]['country']
article=items[0]['article']
capitals=[item['capitals'] for item in items]
radio.loadContent(capitals)
radio.setSolByIndex(0)
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

