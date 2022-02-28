extends = /model/basic/dropgroup.pl

title = Ecrire une proposition

labels ==
et
ou
pairs
impairs
divisibles par 3
divisibles par 5
==

shuffled = False

nbdrops = 3

before ==
from sympy import FiniteSet
from sympy2latex import latex
n = randint(20,30)
numbers = set(range(1,n+1))
even=set(range(2,n+1,2))
odd=numbers.difference(even)
div3=set(range(3,n+1,3))
div5=set(range(5,n+1,5))
S={'pairs':even,'impairs':odd,'divisibles par 3':div3,'divisibles par 5':div5}
op=['et','et','ou','ou']
p1=choice(['pairs','impairs'])
p2=choice(['divisibles par 3', 'divisibles par 5'])
op=choice(['et','ou'])
if op=='et':
    P=S[p1].intersection(S[p2])
if op=='ou':
    P=S[p1].union(S[p2])
latexset=latex(FiniteSet(*P))
sol1=p1+" "+op+" "+p2
sol2=p2+" "+op+" "+p1
==

question ==
Compléter la phrase suivante.
==



extracss == #|html| 
<style>
    .drag_style{
        padding: 1em;
        min-width: 2em;
        }
</style>
==


inputblock ==
L'ensemble $! {{latexset}} !$ est l'ensemble des nombres entre 1 et {{n}} qui sont {{ input.drops[0]|component }} {{ input.drops[1]|component }} {{ input.drops[2]|component }}. <br><br>

{% for label in input.labels %} {{ label|component}} {% endfor %}
==

evaluator ==
ans = " ".join(input.get_value())
if ans==sol1 or ans==sol2:
    score=100
else:
    score=0
==

