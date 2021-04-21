extends = /model/math/expr.pl

@loadexo.py

title==
Exercice à math
==

text==#|markdown|
Compléter le math du texte suivant
== 

before==
sol=sin(3)
==

solution ==
La solution est $!{{sol}}!$. {{score}} {{error}}
==