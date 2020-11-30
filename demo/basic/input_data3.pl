extends = /model/basic/input.pl

title ==
Exemple 2
==

data @= /data/elements_chimiques.csv

text ==
Quel élément chimique a pour symbole **{{ symbole }}** ?
==

solution ==
{{ nom }}
==

diffmeasure = EditDist

tolerance = 1

