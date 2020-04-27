extends = /model/math.pl

title = Table de vérité

settings.feedback.class=score

before ==
dragT = DragDrop(id="dragT",droppable=False,content="V")
dragF = DragDrop(id="dragF",droppable=False,content="F")

drop=[]
for i in range(4):
    globals()[f"drop{i}"] = DragDrop(id=f"drop{i}",droppable=True)
    drop.append(globals()[f"drop{i}"])

P=[True,True,False,False]
Q=[True,False,True,False]

case=randint(0,3)

if case==0:
    expr= "$!P!$ et non ($!Q!$)"
    R = [P[i] and not Q[i] for i in range(4)]
elif case==1:
    expr= "$!P!$ ou non ($!Q!$)"
    R = [P[i] or not Q[i] for i in range(4)]
elif case==2:
    expr= "non ($!P!$) et $!Q!$"
    R = [not P[i] and Q[i] for i in range(4)]
elif case==3:
    expr= "non ($!P!$) ou $!Q!$"
    R = [not P[i] or Q[i] for i in range(4)]

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]
sol = ["V" if R[i] else "F" for i in range(4)]
==

text ==
Compléter la table de vérité suivante avec {{ dragT | component}} ou {{ dragF | component}}.
==

form ==
<table>
<tr>
<td> $! P !$ </td>
<td> $! Q !$ </td>
<td> {{expr}} </td>
</tr>
{% for i in range(4) %}
<tr>
<td> {{row1[i]}} </td>
<td> {{row2[i]}} </td>
<td> {{drop[i] | component}} </td>
</tr>
{% endfor %}
</table>
==

evaluator ==
drop=[drop0,drop1,drop2,drop3]
feedback=""
score=100
for i in range(len(drop)):
    if drop[i].content==sol[i]:
        drop[i].css = "success-state"
    else:
        score=0
        drop[i].css = "error-state" 
==

