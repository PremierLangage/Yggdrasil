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



checkbox.setdata_from_rw(_right_, _wrong_, nbitems, randint(minright, maxright))
checkbox.scoring = scoring
==

scoring = AllOrNothing

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

inputblock ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==