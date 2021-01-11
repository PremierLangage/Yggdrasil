extends = /model/math.pl
extends = /model/mathinput.pl

title= Somme finie

text==
Donner le résultat de la somme de {{i}} {{t}} et {{n}}.
<br/>
$! \sum_{i={{i}}}^{ {{n}}} {{C}}{{t}} .!$

Calculer la somme $! A= {{somm}} !$

==

before ==
a=1 
btab= ["n-1","n+1"]
b=btab[randint(0,len(btab)-1)]
c= randint(0,3)
if c==1 :
 c=""
 somm="\sum_{k={{a}}}^{ {{b}}} {{d}}k"
else:
 somm="\sum_{k={{a}}}^{ {{b}}} {{d}}k^{{c}}"
d= randint(1,9)


i = randint(0,5)

term=["k","k^2","k^3"]
t=term[randint(0,2)]
C=randint(1,5)

expr=["n","n-1","n+1","2n+1","2n-1",randint(i+1,i+5)]
n = expr[randint(0,5)]
==

form==
Votre réponse
{{ input|component }}
==