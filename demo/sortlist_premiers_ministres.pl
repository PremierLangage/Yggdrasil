extends = /template/sortlist.pl

title = Premiers ministres de la Ve République

@ premiers_ministres.csv [data.csv]

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rows[1,3,5,7]
sortlist.loadContent([item['name'] for item in items])
==

text ==
Ordonner les nombres suivants du plus petit au plus grand.
==


