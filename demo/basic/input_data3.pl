extends = /model/basic/input.pl

title ==
Chimie
==

data =@ data/elements_chimiques.csv

text ==
Quel élément chimique a pour symbole **{{ symbole }}** ?
==

solution ==
{{ nom }}
==

diffmeasure = EditDist

tolerance = 1

