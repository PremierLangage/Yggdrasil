extends = /model/math/interval.pl

before ==
x0,x1,x2,x3=sorted(sampleint(-5,5, 4))

cas=randint(1,4)
if cas<=2:
    a,b,c,d=x0,x2,x1,x3
elif cas==3:
    a,b,c,d=x0,x1,x2,x3
elif cas==4:
    a,b,c,d=x1,x2,x0,x3

interv=[Interval(a,b),Interval(c,d)]
shuffle(interv)
A,B=interv
sol=A.intersection(B)
==

text == 
On considère les intervalles $! A= {{A|latex}} !$ et $! B= {{B|latex}}. !$
Déterminer $! A \cap B !$.
==