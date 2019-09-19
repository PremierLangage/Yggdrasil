extends = checkbox.pl

right %=
["good_afternoon",
"_upem_",
"bonjour",
"oui"]
==
checkbox.debug=True
wrong %=
["au revoir",
"Hi!",
"def",
"6hello6",
"good-afternoon"]
==

nchoices % 5

nright % [2,3]

text ==
Sélectionner les noms de variables valides en Python dans la liste suivante.
==



