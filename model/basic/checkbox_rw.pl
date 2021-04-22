extends = /model/basic.pl

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffled % true

footerbefore ==
checkbox.setdata_from_rw(right.splitlines(), wrong.splitlines(), nbitems, nbright)

if shuffled:
    checkbox.shuffle()
==

text ==
Indiquer parmi les noms suivants ceux qui sont des noms valides pour une variable en Python.
==

nbitems % 5

nbright % 2

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
