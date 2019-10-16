@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/components.py [custommatchlist.py]

match =: MatchList
match.decorator = CustomMatchList

before==
import random as rd
import csv

with open('data.csv','r') as file:
    rows=list(csv.reader(file,delimiter=','))

items=rd.sample(rows,3)
source=[item[colsource] for item in items]
target=[item[coltarget] for item in items]
#source=[rows[i][colsource] for i in range(4)]
#target=[rows[i][coltarget] for i in range(4)]
match.loadContent(source,target)
==

title==
{{rows}}
Capitales des pays d'Europe
==

text==
Relier chaque pays à sa capitale.
==

form==
{{ match|component }}
==

evaluator==
match.eval()
==





