extends = /model/basic.pl

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffled % true

footerbefore ==
from random import randint

if isinstance(right, str):
    lst_right = right.splitlines()
elif isinstance(right, list):
    lst_right= right
else:
    raise TypeError("right must be a string or a list")

if isinstance(wrong, str):
    lst_wrong = wrong.splitlines()
elif isinstance(wrong, list):
    lst_wrong = wrong
else:
    raise TypeError("wrong must be a string or a list")

if isinstance(nbright, list):
    nbright0 = randint(*nbright)
else:
    nbright0 = nbright

checkbox.setdata_from_rw(lst_right, lst_wrong, nbitems, nbright0)
==

text ==
Indiquer parmi les noms suivants ceux qui sont des noms valides pour une variable en Python.
==

nbitems % 5

nbright % [2, 3]

right ==
bonjour
abc
oui
NON
Ciao
good_morning
byeBye7
\_UGE\_
==

wrong ==
Hi!
au revoir
6hello6
def
for
good-afternoon
f()
==

settings.feedback = lightscore

form ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==
