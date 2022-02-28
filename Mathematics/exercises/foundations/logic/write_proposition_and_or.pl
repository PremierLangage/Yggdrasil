extends = /model/basic/mathdragdrop.pl

title = Ecrire une proposition

before ==
n=randint(20,30)
numbers=set(range(1,n+1))
even=set(range(2,n+1,2))
odd=numbers.difference(even)
div3=set(range(3,n+1,3))
div5=set(range(5,n+1,5))
S={'pairs':even,'impairs':odd,'divisibles par 3':div3,'divisibles par 5':div5}
choices=[]
numsol=list_randint_norep(randint(1,3),0,3)
op=['et','et','ou','ou']
p1=randitem(['pairs','impairs'])
p2=randitem(['divisibles par 3', 'divisibles par 5'])
op=randitem(['et','ou'])
if op=='et':
    P=S[p1].intersection(S[p2])
if op=='ou':
    P=S[p1].union(S[p2])
latexset=latex(FiniteSet(*P))
sol1=p1+" "+op+" "+p2
sol2=p2+" "+op+" "+p1
drags = [drag1,drag2,drag3,drag4,drag5,drag6]
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

drag1 =: DragDrop
drag1.content = et

drag2 =: DragDrop
drag2.content = ou

drag3 =: DragDrop
drag3.content = pairs

drag4 =: DragDrop
drag4.content = impairs

drag5 =: DragDrop
drag5.content = divisibles par 3

drag6 =: DragDrop
drag6.content = divisibles par 5

form ==
{% macro list_components(lst) -%}
    {% for e in lst %}
        {{ e |component}}
    {% endfor %}
{%- endmacro %}


L'ensemble $! {{latexset}} !$ est l'ensemble des nombres entre 1 et {{n}} qui sont {{ drop1 | component }} {{ drop2 | component }} {{ drop3 | component }}. <br><br>

{{ list_components(drags) }}
==

evaluator ==
ans=drop1.content+" "+drop2.content+" "+drop3.content
if ans==sol1 or ans==sol2:
    score=100
else:
    score=0
feedback=""
==

