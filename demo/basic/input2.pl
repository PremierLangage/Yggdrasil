extends = /model/basic/input.pl

title ==
Exemple 2
==

data ==
symbole;nom
N;azote
Na;sodium
H;hydrogène
==

text ==
Quel élément chimique a pour symbole **{{ symbole }}** ?
==

solution ==
{{ nom }}
==

measure = distance

tolerance % 1



