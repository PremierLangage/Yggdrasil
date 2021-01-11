extends = /model/math.pl
extends = /model/mathinput.pl

title= Somme finie

text==
Donner le résultat de la somme de {{i}} et {{n}}.
$! \Sigma_{i={{i}}}^{{n}} {{n}} !$
==

before ==
i = randint(0,5)

term=["k","k^2","k^3"]
C=randint(1,5)

expr=["n","n-1","n+1","2n+1","2n-1",randint(i+1,i+5)]
n = expr[randint(0,5)]
==

form==
Votre réponse
{{ input|component }}
==