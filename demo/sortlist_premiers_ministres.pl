extends = /template/sortlist.pl

title = Premiers ministres de la Ve République

before ==
import random as rd

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
items.sort(key=sortSecond)

sortlist.loadContent([item['capital'] for item in items])
==

text ==
Ordonner les nombres suivants du plus petit au plus grand.
==


