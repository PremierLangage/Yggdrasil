@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

match =: MatchList

before==
import random as rd
import csv

with open('data.csv','r') as file:
    rows=list(csv.reader(file,delimiter=','))

n={{nitems}}
cs={{colsource}}
ct={{coltarget}}

items=rd.sample(rows,n)
match.nodes = []
expected = []
for i in range(len(items)):
    sourceId = "source" + str(i)
    targetId = "target" + str(i)

    match.nodes.append({
        "id": sourceId,
        "content": items[i][ct],
        "source": True,
    })

    match.nodes.append({
        "id": targetId,
        "content": items[i][cs],
        "target": True,
    })
    expected.append({ "source": sourceId, "target": targetId })

rd.shuffle(match.nodes)
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

evaluator== #|python|

def in_links(conn, links):
    for e in links:
        if e['source'] == conn["source"] and  e['target'] == conn["target"]:
            return True
    return False

error = 0
for e in expected:
    if not in_links(e, match.links):
        error = error + 1

for e in match.links:
    e['css'] = 'error-state anim-fade'
    if in_links(e, expected):
        e['css'] = 'success-state  anim-flip'

if error == 0:
    grade = (100, '<span class="success-state">Good answser</span>')
else:
    grade = (0, '<span class="error-state">Bad answer, you made %d mistakes</span>' % error)
==


