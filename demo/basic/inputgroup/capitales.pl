extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
inputs = [TextInput(), TextInput(), TextInput()]
for input in inputs:

==

question ==
Quel pays a pour capitale {{capitale}} ?
==
