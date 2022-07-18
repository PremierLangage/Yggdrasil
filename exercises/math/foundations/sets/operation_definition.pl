extends = /model/math/dropgroup.pl

title = Définition des opérations sur les ensembles

before==#|python|

relation="symbol"
if relation=="symbol":
    label_in = "$! \in !$"
    label_notin = "$! \\notin !$"

labelcontents = [label_in, label_notin]

n=4
a=randint(0,1)
b=randint(0,1)

if a==1:
    symbA="\in"
else:
    symbA="\\notin"
if b==1:
    symbB="\in"
else:
    symbB="\\notin"

data=[
["A",r"\cap", "B", a*b],
["A",r"\cup", "B", a+b],
["A",r"\setminus", "B", a*(1-b)],
["B",r"\setminus", "A", b*(1-a)],
["A",r"\cap", "B^c", a*(1-b)],
["A^c",r"\cap", "B", (1-a)*b],
["A",r"\cup", "B^c", a+(1-b)],
["A^c",r"\cup", "B", (1-a)+b],
["A^c",r"\cap", "B^c", (1-a)*(1-b)],
["A^c",r"\cup", "B^c", (1-a)+(1-b)]
]


cases=[randint(0,1),randint(2,3),randint(4,7),randint(8,9)]

rhs=[]
sol=[]
for i in cases:
    rhs.append(data[i][0]+" "+data[i][1]+" "+data[i][2])
    if data[i][3]>=1:
       sol.append(label_in)
    else:
        sol.append(label_notin)
==

question ==
Soit $! A !$ et $! B !$ deux sous-ensembles d'un ensemble $! E !$. Soit $! x !$ un élément de $! E !$ tel que
$! x {{symbA}} A !$ et $! x {{symbB}} B.!$

Compléter les propositions suivantes avec les symboles {{ input.labels[0]|component }} ou {{ input.labels[1]|component }}.
==

inputblock ==
<ul>
{% for drop in input.drops %}
<li> $! x !$ {{ drop|component }} $! {{rhs[loop.index0]}}  !$ </li>
{% endfor %}
</ul>
==




