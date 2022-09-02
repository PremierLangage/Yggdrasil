extends= /model/basic/checkbox_rw.pl


title = Limites

question==
Parmi ces limites, lesquelles valent $!+\infty!$? 
==
 

nbitems=4
minright = 2
maxright = 2

right== 
$!\lim\limits_{x\rightarrow 2} \frac{1}{(x-2)^2}!$
$!\lim\limits_{x\rightarrow +\infty} e^{-x}+\ln(x)+x-2!$ 
==

wrong==
$!\lim\limits_{x\rightarrow 0} \frac{1}{x}!$
$!\lim\limits_{x\rightarrow +\infty} \frac{x^2+2}{2x-x^2}!$ 
==

scoring = CorrectItems

reroll = False

 
 





