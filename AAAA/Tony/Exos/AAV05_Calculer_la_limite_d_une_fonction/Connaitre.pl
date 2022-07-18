extends= /model/basic/checkbox_rw.pl


title = Limites usuelles

text==
Parmi ces limites lesquelles valent $!+\infty!$?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!\lim\limits_{x\rightarrow +\infty}\exp(x)!$ 
$!\lim\limits_{x\rightarrow +\infty}x^2!$ 
$!\lim\limits_{x\rightarrow -\infty}x^2!$ 
$!\lim\limits_{x\rightarrow +\infty}\ln(x)!$ 
$!\lim\limits_{x\rightarrow +\infty}\sqrt{x}!$ 
$!\lim\limits_{x\rightarrow +\infty}x^3!$ 
$!\lim\limits_{x\rightarrow 0^+}\frac{1}{x}!$
$!\lim\limits_{x\rightarrow +\infty}0!$   
==

wrong== 
$!\lim\limits_{x\rightarrow 0^+}\ln(x)!$ 
$!\lim\limits_{x\rightarrow +\infty}\sin(x)!$ 
$!\lim\limits_{x\rightarrow +\infty}\cos(x)!$ 
$!\lim\limits_{x\rightarrow -\infty}\exp(x)!$ 
$!\lim\limits_{x\rightarrow 0}\sqrt{x}!$ 
$!\lim\limits_{x\rightarrow 0}\frac{1}{x}!$
$!\lim\limits_{x\rightarrow +\infty}1!$  
==




