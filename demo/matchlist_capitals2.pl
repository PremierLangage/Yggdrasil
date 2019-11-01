extends = /template/matchlist.pl

title==
Capitales des pays d'Europe
==

@ country_data.csv [data.csv]

before==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
source=[item['country'] for item in items]
target=[item['capital'] for item in items]

match.loadContent(source,target)
==

text==
Relier chaque pays à sa capitale.
==





