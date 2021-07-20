extends= /model/qcm/qcm.pl


title= Parité de fonctions

text==
Parmi ces fonctions, lesquelles sont paires?
==

 

nb=4
nbtrues = 2

good==
from random import randint
a = randint(1,5)

$!f:x\mapsto \cos(a*x)!$
$!f:x\mapsto \sin(a*x^2)!$
$!f:x\mapsto \frac{a*x^2}{2+3x^4}!$
$!f:x\mapsto \sin(a*x)\sin(2x)!$
==

bad==
$!f:x\mapsto \sin(x)!$
$!f:x\mapsto \tan(x)!$
$!f:x\mapsto x(1+x)!$
$!f:x\mapsto e^x!$
==



