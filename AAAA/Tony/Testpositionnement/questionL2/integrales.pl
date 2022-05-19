
extends= /model/basic/checkbox_rw.pl

 
question==
Quelles intégrales valent $!\frac{5}{6}!$?
==
 

nbitems=4
minright = 0
maxright = 0

right== 
$!\int_{-1}^1 t^2+tdt!$
==

wrong==
$!\int_0^1 \frac{x}{\sqrt{x+1}}dx!$
$!\int_0^1 te^tdt!$
$!\int_0^1 x\cos(x^2)dx!$
==

scoring = RightMinusWrong
  
 