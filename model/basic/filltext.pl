extends = /model/basic/dragdrop.pl

shuffle = True

question ==
Compléter le texte suivant avec les étiquettes.
==


process ==
import re
from multicomp import LabelGroup, DropGroup

sol = []
counter = 0
newstring = ''
start = 0
for m in re.finditer(r"{([^{}]+)}", filledtext):
    end, newstart = m.span()
    newstring += filledtext[start:end]
    rep = "{{ drp.comp[" + str(counter) + "]|component }}"
    sol.append(m.group(1)) 
    newstring += rep
    start = newstart
    counter += 1
newstring += filledtext[start:]

_sol_ = sol

if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

_labels_ = list(set(_labels_ + _sol_))

lab = LabelGroup(_labels_)
drp = DropGroup(_sol_)

_sol_ = sol


_labels_ = list(set(_labels_ + _sol_))

part2 = "&nbsp;".join(["{{ lab.comp[" + str(i) + "]|component }}" for i in range(len(_labels_))]
)

inputblock = newstring + "\n\n" + part2
==

