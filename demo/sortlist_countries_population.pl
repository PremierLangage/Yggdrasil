extends = /template/sortlist.pl

title = Ordonner des nombres


@country_data.csv [data.csv]

before ==
import random as rd
import csv
def sortSecond(val): 
    return int(val['population'])
with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
items.sort(key=sortSecond)
source=[item['country'] for item in items]
target=[item['capital'] for item in items]


sortlist.loadContent([item['country']+item['population'] for item in items])
==

text ==
{{items}}
Ordonner ces capital de la moins peuplée à la plus peuplée.
==

