extends= /model/basic/checkbox_rw.pl


title = Connaître les limites de fonctions usuelles

text==
Parmi ces limites lesquelles valent $!+\infty!$?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!\lim\limits_{x\rightarrow +\infty}\exp(x)+x^2+11/ln(x)!$ 
$!\lim\limits_{x\rightarrow +\infty}x^2+\ln(x)!$ 
$!\lim\limits_{x\rightarrow 0}-\frac{\ln(x)}{x}!$ 
$!\lim\limits_{x\rightarrow 0}e^x+x-\ln(x)!$ 
$!\lim\limits_{x\rightarrow +\infty}\sqrt{x}+x^2+e^{x^2}!$ 
$!\lim\limits_{x\rightarrow -\infty}\exp(x)+x^2+1/x!$ 
$!\lim\limits_{x\rightarrow 0^+}\frac{1}{x}!$ 
$!\lim\limits_{x\rightarrow 1^-}\frac{1}{1-x}!$ 
$!\lim\limits_{x\rightarrow 2}\frac{1}{(2-x)^2}!$ 
$!\lim\limits_{x\rightarrow 0}\frac{1}{x^2}!$ 
==

wrong== 
$!\lim\limits_{x\rightarrow 1}\frac{1}{1-x}!$ 
$!\lim\limits_{x\rightarrow 2}\frac{-1}{(2-x)^2}!$ 
$!\lim\limits_{x\rightarrow 0}\frac{1}{e^x}!$ 
$!\lim\limits_{x\rightarrow 1}\ln(x)!$   
$!\lim\limits_{x\rightarrow -\infty}\exp(x)+1/x!$ 
$!\lim\limits_{x\rightarrow 0}\sqrt{x}-x^2!$ 
$!\lim\limits_{x\rightarrow 0}\frac{1}{x}!$ 
==





