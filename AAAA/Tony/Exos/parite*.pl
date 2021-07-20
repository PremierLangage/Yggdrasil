extends= /model/qcm/qcm.pl


title= Parité de fonctions

text==
Parmi ces fonctions, lesquelles sont paires?
==

before ==
from random import randint
a = randint(1,5)
== 

nb=4
nbtrues = randint(1,5)

good==
$!f:x\mapsto \cos(a*x)!$
$!f:x\mapsto \sin(x^2)!$
$!f:x\mapsto \frac{x^2}{2+3x^4}!$
$!f:x\mapsto \sin(x)\sin(2x)!$
==

bad==
$!f:x\mapsto \sin(x)!$
$!f:x\mapsto \tan(x)!$
$!f:x\mapsto x(1+x)!$
$!f:x\mapsto e^x!$
==



