extends = /model/basic.pl

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffled % true

footerbefore ==
from random import randint

if isinstance(right, str):
    _right_ = right.splitlines()
elif isinstance(right, list):
    _right_= right
else:
    raise TypeError("right must be a string or a list")

if isinstance(wrong, str):
    _wrong_ = wrong.splitlines()
elif isinstance(wrong, list):
    _wrong_ = wrong
else:
    raise TypeError("wrong must be a string or a list")

if isinstance(nbright, list):
    _nbright_ = randint(*nbright)
elif isinstance(nbright, int):
    _nbright_ = nbright

checkbox.setdata_from_rw(_right_, _wrong_, nbitems, _nbright_)
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
