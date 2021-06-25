extends = /model/basic/dragdrop.pl

shuffle = True

question ==
Compléter le texte suivant avec les étiquettes.
==


process ==
sol = re.findall(r'\{(.*?)\}', filledtext)

count = -1
def replace(x):
    global count
    count += 1
    return "{{ cdrops[" + str(count) + "]}}"

part1 = re.sub(r'\{(.*?)\}', replace , filledtext)

from customdragdrop import CustomDragDrop
cplabels, cpdrops = [], []
clabels, cdrops= [], []

if isinstance(sol, str):
    _sol_ = sol.splitlines()
else:
    _sol_ = sol

if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

_labels_ = list(set(_labels_ + _sol_))

for i, content in enumerate(_labels_):
    cplabels.append(CustomDragDrop.Label(content=content))
    selector = cplabels[i].selector
    cid = cplabels[i].cid
    clabels.append("<%s cid='%s'></%s>" % (selector, cid, selector))

nbdrops = len(_sol_)

for i in range(nbdrops):
    cpdrops.append(CustomDragDrop.Drop())
    selector = cpdrops[i].selector
    cid = cpdrops[i].cid
    cdrops.append("<%s cid='%s'></%s>" % (selector, cid, selector))

import re

part2 = "&nbsp;".join(clabels)

inputblock = part1 + "\n" + part2
==

