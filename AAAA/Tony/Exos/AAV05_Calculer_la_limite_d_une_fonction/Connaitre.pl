extends= /model/basic/checkbox_rw.pl


title = Limites usuelles

text==
Parmi ces limites lesquelles valent $!+\infty!$?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!\lim_{x\rightarrow +\infty}exp(x)!$
==

wrong==
$!f:x\mapsto \sin(x)!$
$!f:x\mapsto \tan(x)!$
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
==




