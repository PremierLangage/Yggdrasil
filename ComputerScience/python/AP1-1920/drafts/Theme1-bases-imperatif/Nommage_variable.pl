#author = Olivier Champalle
# + DR
extends=/ComputerScience/python/template/qcm_template.pl

title=Nommage de variables

text=Parmi les chaines suivantes, sélectionnez celles qui sont des noms de variables valides.

mybuild==
nbtrues = random.randint(2,3)
==

nb=6
uncrosedfalse=
good==
abc
bonjour
oui
Ciao
NON
byeBye7
_upem_
good_morning
DEF
limite
axiome
si
sinon
==

bad==
au revoir
Hi!
def
6hello6
good-afternoon
True
False
3+4
lim%8
if
==

feedback=show





