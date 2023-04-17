
@ /utils/sandboxio.py
@ /AAAA/dominique/utils/drutils.py 
title=
text=
form=

builder=@ /builder/bbefore.py
grader=


first==
## **Bienvenu sur l'assistant online d'aide à la génération de rapport pour la review de code en langage C.**
<br />
Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour la production évaluée.

Prennez votre temps pour valider pas à pas votre rapport mais ATTENTION n'actualiser la page à aucun moment, vous perdriez votre début de rapport et cela réinitialiserait le générateur à la première étape.
==
before==
from drutils import raiseifabsent

raiseifabsent('texts', ' Liste de critères ')
texts = first + texts
raiseifabsent('formfills','liste de choix des différents critères ')
forms = fristform + buildform(formfills)

==
