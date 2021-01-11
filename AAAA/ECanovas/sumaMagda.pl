extends = /model/math.pl
extends = /model/mathinput.pl

title= Somme finie

text==
Donner le résultat de la somme de {{i}} et {{n}}. 
==

before ==
expr=["n","n-1","n+1","2n+1","2n-1"]
n = expr[randint(0,4)]
i = randint(0,5)
==

form==
Votre réponse
{{ input|component }}
==