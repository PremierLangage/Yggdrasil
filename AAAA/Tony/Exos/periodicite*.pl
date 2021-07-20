extends= /model/basic/checkbox_rw.pl


title= Parité de fonctions

text==
Parmi ces fonctions, lesquelles sont périodiques?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!f:x\mapsto \sin(x)!$
$!f:x\mapsto \tan(x)!$
$!f:x\mapsto \cos(x)!$
$!f:x\mapsto \sin(x)\sin(2x)!$
$!f:x\mapsto 0!$
$!f:x\mapsto 1!$
==

wrong==
$!f:x\mapsto 6x^2!$
$!f:x\mapsto \sin(x^2)!$
$!f:x\mapsto \frac{x^2}{2+3x^4}!$
$!f:x\mapsto x(1+x)!$
$!f:x\mapsto e^x!$
$!f:x\mapsto \ln(x)!$
$!f:x\mapsto x^3!$
$!f:x\mapsto x^5!$
$!f:x\mapsto x^{11}!$
$!f:x\mapsto \frac{x^2}{2x+3x^4}!$
$!f:x\mapsto \sqrt{x}!$
$!f:x\mapsto 3x!$
$!f:x\mapsto 5x-2!$
$!f:x\mapsto e^{-x^2}!$
$!f:x\mapsto \sqrt{x^2+4}!$
==




