extends = /model/math.pl
extends = /model/mathinput.pl

title= Somme finie

text==

Calculer la somme $! A= {{somm}} !$
<br/>
{{solu}}
==

before ==
a=1 
btab= ["n-1","n+1"]
b=btab[randint(0,len(btab)-1)]
c= randint(0,3)
if c==1 :
 c=""
 somm="\sum_{k={{a}}}^{ {{b}}} {{d}}k"
else:
 somm="\sum_{k={{a}}}^{ {{b}}} {{d}}k^{{c}}"
d= randint(1,9)

f="{{d}}k^{{c}}"
solu=summation(f, (i, a, b))
==

form==
Votre réponse
{{ input|component }}
==

feedback==
On rappelle que si $n \ge 1$ on a 
$\sum_k=1^n 1 = n$, $\ sum_k=1^n k = n(n+1)/2$,  $\sum_k=1^n k^2 = n(n+1)(2n+1)/6$,  $\sum_k=1^n k^3 = n^2(n+1)^2/4$.”

==