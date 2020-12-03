extends= /AAAA/dominique/mathmatchlist.pl

title==
Matching list
==

before==

var('x')

verbs=["to meet", "to know", "to put", "to see", "to give", "to say"]
pairs=["met", "knew", "put", "saw","gave", "said"]

if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    matchlist.setdata_from_matches([v for v in verbs ,l for l in  pairs])

==

text==
Match each verbs to its preterit
==

doc ==
Exos à choix unique où on doit relier chaque élèment de la première case à un élèment de la seconde case. 
Code couleurs : Après validation de la réponse 
-> Flèches vertes = réponses justes
-> Flèches rouges = réponses fausses
==

