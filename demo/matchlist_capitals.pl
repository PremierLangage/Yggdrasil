extends = /template/basic.pl

@ /utils/matchlist.py [custommatchlist.py]

@ country_data.csv [data.csv]


match =: MatchList

before==
# match.decorator = CustomMatchList
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

items=rd.sample(rows,4)
source=[item['country'] for item in items]
target=[item['capital'] for item in items]

match.nodes = []
expected = []
for i in range(4):
    a = random.randint(1, 10)
    b = random.randint(1, 10)
    sourceId = "source" + str(i)
    targetId = "target" + str(i)

    match.nodes.append({
        "id": sourceId,
        "content": "%d * %d" % (a, b),
        "source": True,
    })

    match.nodes.append({
        "id": targetId,
        "content": "%d" % (a * b),
        "target": True,
    })
    expected.append({ "source": sourceId, "target": targetId })
rd.shuffle(match.nodes)


# match.loadContent(source,target)
==

title==
Capitales des pays d'Europe
==

text==
Relier chaque pays à sa capitale.
==

form==
{{ match | component }}
==

evaluator==
grade = match.eval()
==


