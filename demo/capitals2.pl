@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data.csv [data.csv]


match =: MatchList

before==
import random as rd
import csv

with open('data.csv','r') as file:
    rows=list(csv.reader(file,delimiter=','))

n=5

items=rd.sample(rows,4)
cs=0
ct=2

match.nodes = []
expected = []
for i in len(item):
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
Match List Component
==

text==
*Link each operation to the appropriate result.*
==

# STEP 3
form==
{{ match|component }}
==

# STEP 4
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

