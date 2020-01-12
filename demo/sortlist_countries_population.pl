extends = /template/sortlist.pl

title = Ordonner des Capitales


@ country_data.csv [data.csv]

before ==
import random as rd
import csv
def sortSecond(val): 
    return int(val['population'])
with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
items.sort(key=sortSecond)


sortlist.loadContent([item['capital'] for item in items])
==
## {{items}}
text ==

Ordonner ces capitales de la moins peuplée à la plus peuplée.
==

