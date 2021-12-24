extends = /model/basic/dragdrop.pl

shuffle = True

question ==
Compléter le texte suivant avec les étiquettes.
==

process ==
from customdragdrop import LabelGroup, DropGroup

if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

drp = DropGroup()
drp.set_filledtext(filledtext)

_labels_ = list(set(_labels_ + drp._sol))
lab = LabelGroup(_labels_)


inputblock = drp.paste_embed() +"\n\n" + lab.paste_all()
==

