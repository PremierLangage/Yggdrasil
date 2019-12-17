extends = /Mathematics/template/mathinput.pl

title = Calcul de primitive

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
a=randitem([Rational(1,2),Rational(1,3),Rational(1,4),2,3,4])
b=randint(-5,5,[0])
c=randint(-5,5,[0])

b0=Rational(-c,b)
if b>0:


if s>0:
    sol=a/b*ln(b*x+c)
else:
    sol=-a/b*ln(-b*x-c)
\text{Ip=\lbrack \b0,+\infty\lbrack}
\text{Isp=\rbrack \b0,+\infty\lbrack}
}{
\text{Ip=\rbrack -\infty,\b0\rbrack}
\text{Isp=\rbrack -\infty,\b0\lbrack}
}

\text{cas=randint(1..8)}
\if{\cas=1}{
\text{f=simplify(\a/(\b*\var+\c))}
\text{I=\Isp}
}
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{latexf}} $$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==

