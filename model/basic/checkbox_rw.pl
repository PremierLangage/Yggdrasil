extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

before_scripts % ["importfunc", "before", "process"]

importfunc ==
from random import randint, choice, choices, sample, shuffle
==

process ==
from random import randint
from ast import literal_eval

nbitems = literal_eval(str(nbitems))
minright = literal_eval(str(minright))
maxright = literal_eval(str(maxright))

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

checkbox.setdata_from_rw(_right_, _wrong_, nbitems, randint(minright, maxright))
checkbox.scoring = scoring
==

scoring = AllOrNothing

text ==
Indiquer parmi les noms suivants ceux qui sont des noms valides pour une variable en Python.
==


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
