extends=../../templates/plsoluce.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
Ecrivez un programme qui prend en entrée un entier et affiche "Vrai" si l'entier est dans l'interval $%{{ latex }}%$ et "Faux" sinon.
==


before==
import interval

_iterval = interval.makeinterval()
latex = _iterval[0]
solution = _iterval[1]
==

plsoluce==

==


