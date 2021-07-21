extends= /model/basic/checkbox_rw.pl


title = Limites usuelles

text==
Parmi ces limites lesquelles valent $!+\infty!$?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!\lim\limits_{x\rightarrow +\infty}\frac{\exp(x)}{x}!$ 
$!\lim\limits_{x\rightarrow +\infty}\frac{\exp(x)}{x^2}!$ 
$!\lim\limits_{x\rightarrow -\infty}-\frac{\exp(-x)}{x**3}!$ 
$!\lim\limits_{x\rightarrow +\infty}\frac{x^3}{\ln(x)}!$  
$!\lim\limits_{x\rightarrow +\infty}x\exp(x)}!$ 
$!\lim\limits_{x\rightarrow +\infty}x\ln(x)}!$ 
==

wrong== 
$!\lim\limits_{x\rightarrow 0^+}x\ln(x)!$ 
$!\lim\limits_{x\rightarrow 0^+}x^2\ln(x)!$ 
$!\lim\limits_{x\rightarrow -\infty}\frac{\exp(x)}{x}!$ 
$!\lim\limits_{x\rightarrow -\infty}\frac{\exp(x)}{x^2}!$ 
$!\lim\limits_{x\rightarrow +\infty}x\exp(-x)}!$ 
$!\lim\limits_{x\rightarrow +\infty}\frac{x^2}{\exp(x)}!$ 
$!\lim\limits_{x\rightarrow +\infty}\frac{\ln(x)}{x}!$ 
$!\lim\limits_{x\rightarrow +\infty}\frac{\ln(x)}{x^2}!$ 
==





