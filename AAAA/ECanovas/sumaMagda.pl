extends = /model/math.pl
extends = /model/mathinput.pl



mathinput =: MathInput

title= Somme finie

text==

Calculer la somme $! A= {{somm}} !$
<br/>
$!{{solu|latex}}!$
<br/>
$!{{f|latex}}!$
<br/>
{{feedback}}
==

before ==
f= symbols('f', cls=Function)
i, n, k = symbols('i n k', integer=True)

a=1 
btab= [n-1,n+1]
b=btab[randint(0,len(btab)-1)]
c= randint(0,3)
d= randint(1,9)

if c==1 :
 c=""
 somm="\sum_{k={{a}}}^{ {{b}}} {{d}}k"
 f="k"
 if d>1:
  f=str(d)+"*k"
else:
 somm="\sum_{k={{a}}}^{ {{b}}} {{d}}k^{{c}}"
 f=str(d)+'*k**'+str(c)

solu=summation(f, (i, a, b))
==

form==
Votre réponse
{{ mathinput|component }}
==

evaluator==
if mathinput==solu :
 Bonne réponse !<br/>
 {{feedback}}
else:
 Mauvaise réponse !<br/>
 {{feedback}}
==

feedback==
On rappelle que si $!n \ge 1!$ on a
<ul>
<li>$!\sum_k=1^n 1 = n,!$</li>
<li>$!\sum_k=1^n k = n(n+1)/2,!$</li>
<li>$!\sum_k=1^n k^2 = n(n+1)(2n+1)/6,!$</li>
<li>$!\sum_k=1^n k^3 = n^2(n+1)^2/4.!$</li>
</ul>
==