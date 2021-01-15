extends = /model/math.pl
extends = /model/mathinput.pl



mathinput =: MathInput

title= Somme finie

text==#|markdown|

Calculer la somme $% A= {{somm}} %$

<br>

$% {{solu|latex}} %$

<br>

$% {{f|latex}}%$

==

before==#|python|
f= symbols('f', cls=Function)
i, k = symbols('i k', integer=True)

a=1 
btab= ["n-1","n+1"]
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

form==#|markdown|
Votre réponse
{{ mathinput|component }}
==

evaluator==#|python|
if mathinput==solu :
    score = 100
    feedback = "Bonne réponse !"
else:
    score = 0
    feedback = "Mauvaise réponse, la réponse était : "+str(solu)
==

rappels==#|markdown|
On rappelle que si $!n \ge 1!$ on a
<ul>
<li>$! \displaystyle\sum_{k=1}^n 1 = n,!$</li>
<li>$! \displaystyle\sum_{k=1}^n k = \frac{n(n+1)}{2},!$</li>
<li>$! \displaystyle\sum_{k=1}^n k^2 = \frac{n(n+1)(2n+1)}{6},!$</li>
<li>$! \displaystyle\sum_{k=1}^n k^3 = \frac{n^2(n+1)^2}{4}.!$</li>
</ul>
==
