extends = /Mathematics/template/mathbasic2.pl
@ /input/drop/template.html [drop_template.html]
@ /input/drag/template.html [drag_template.html]
@ /input/dragdrop/head.html [dragdrop_head.html]
@ /input/dragdrop/process.py [dragdrop_process.py]

title = Connecteurs et et ou

lang = fr

before ==
numbers=set(range(1,26))
even=set(range(2,26,2))
odd=numbers.difference(even)
div3=set(range(3,26,3))
div5=set(range(5,26,5))
S={'pair':even,'impair':odd,'divisible par 3':div3,'divisible par 5':div5}
choices=[]
numsol=list_randint_norep(randint(1,3),0,3)
op=['et','et','ou','ou']
p1=randitem(['pair','impair'])
p2=randitem(['divisible par 3', 'divisible par 5'])
op=randitem(['et','ou'])
if op=='et':
    P=S[p1].intersection(S[p2])
if op=='ou':
    P=S[p1].union(S[p2])
latexset=latex(FiniteSet(*P))
==

text ==
On considère l'ensemble
$$ {{latexset}} $$
==

form ==
Il s'agit de l'ensemble des nombres entre 1 et 25 qui sont {{ input_1_0 }} {{ input_1_1 }} {{ input_1_2 }}. <br><br>

{{ input_1_et }} {{ input_1_ou }} {{ input_1_odd }} {{ input_1_even }}
{{ input_1_div3 }} {{ input_1_div5 }}
==

input.1.type = dragdrop
input.1.drag = {'et':'et','ou':'ou','odd':'pairs','even':'impairs','div3':'divisibles par 3','div5':'divisibles par 5'}
input.1.drop = {'0':'','1':'','2':''}
input.1.cloneable = yes
input.1.style = min-width:2em

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==

