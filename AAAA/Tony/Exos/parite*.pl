extends= /model/qcm/qcm.pl


title= Parité de fonctions

text==
Parmi ces fonctions, lesquelles sont paires?
==

before ==
a = randint(1,5)
nb=4
nbtrues = a
==

good==
$!f:x\mapsto \sin(x)$
$!f:x\mapsto \sin(x)$
$!f:x\mapsto \sin(x)$
$!f:x\mapsto \sin(x)$
==

bad==
$!f:x\mapsto \sin(x)$
$!f:x\mapsto \sin(x)$
$!f:x\mapsto \sin(x)$
$!f:x\mapsto \sin(x)$
==



