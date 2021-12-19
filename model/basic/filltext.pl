extends = /model/basic/dragdrop.pl

shuffle = True

question ==
Compléter le texte suivant avec les étiquettes.
==

process ==
from multicomp import LabelGroup, DropGroup, process_filledtext

_sol_, newstring = process_filledtext(filledtext, "drp")

if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

_labels_ = list(set(_labels_ + _sol_))

lab = LabelGroup(_labels_)
drp = DropGroup(_sol_)

_labels_ = list(set(_labels_ + _sol_))

part2 = "&nbsp;".join(["{{ lab.comp[" + str(i) + "]|component }}" for i in range(len(_labels_))]
)

inputblock = newstring + "\n\n" + part2
==

