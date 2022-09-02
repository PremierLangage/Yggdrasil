extends= /model/basic/checkbox_rw.pl

title = Nombres complexes

question==
Quels complexes ont leur partie réelle strictement positive?
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!2e^{i\frac{\pi}{3}}!$  
==

wrong==
$!1+i-i(2-3i)!$
$!-11+5i!$
$!\frac{1+i}{1-i}!$
==

scoring = CorrectItems

reroll = False
#settings.allow_reroll = false 