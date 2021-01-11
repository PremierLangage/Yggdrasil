extends = /model/math.pl
extends = /model/mathinput.pl

title= Somme finie

text==

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
==

form==
Votre réponse
{{ input|component }}
==