
@ /utils/sandboxio.py
@ /AAAA/dominique/utils/drutils.py 
title=
text=
form=

builder=@ /builder/bbefore.py
grader=

before==
from drutils import raiseifabsent

raiseifabsent('texts', ' Liste de critères ')
texts = first + texts
raiseifabsent('formfills','liste de choix des différents critères ')


==
