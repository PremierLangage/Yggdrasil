extends = /template/basic.pl

@ /utils/matchlist.py [custommatchlist.py]

@ country_data.csv [data.csv]


match =: MatchList
match.decorator = CustomMatchList

before==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
source=[item[keysource] for item in items]
target=[item[keytarget] for item in items]
match.loadContent(source,target)
==

title==
Capitales des pays d'Europe
==

text==
Relier chaque pays à sa capitale.
==

form==
{{ match|component }}
==

evaluator==
grade=match.eval()
==

