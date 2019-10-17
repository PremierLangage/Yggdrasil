@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/components.py [custommatchlist.py]

match =: MatchList
match.decorator = CustomMatchList

before==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,nitems)
source=[item[keysource] for item in items]
target=[item[keytarget] for item in items]
match.loadContent(source,target)
==

title==
{{n}}
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





