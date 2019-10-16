@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/utilscomp.py [utilscomp.py]

match =: MatchList

before==
import random as rd
import csv
from components import MatchList,Component

match2=MatchList():


class MatchList(Component):
    def loadContent(self,source,target):
        self.nodes = []
        expected = []
        for i in range(len(source)):
            sourceId = "source" + str(i)
            targetId = "target" + str(i)

            self.nodes.append({
                "id": sourceId,
                "content": source[i],
                "source": True,
            })

            self.nodes.append({
                "id": targetId,
                "content": target[i],
                "target": True,
            })
            expected.append({ "source": sourceId, "target": targetId })
        rd.shuffle(self.nodes)

with open('data.csv','r') as file:
    rows=list(csv.reader(file,delimiter=','))

items=rd.sample(rows,nitems)
#source=[item[colsource] for item in items]
#target=[item[coltarget] for item in items]
source=["1","2"]
target=["1","2"]
match2.loadContent(source,target)
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




