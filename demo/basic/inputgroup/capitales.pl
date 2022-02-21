extends = /model/basic/inputgroup.pl

@ /demo/data/pays_europe.csv

before ==
inputs = [TextInput(), TextInput()]
inputs[0].sol = Paris
inputs[1].sol = Rome
==

question ==
Quelle est la capitale des pays suivants ?
==
