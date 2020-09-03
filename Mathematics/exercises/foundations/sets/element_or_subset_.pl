extends = /model/math.pl

title = Elément et sous-ensemble

param.cases = [1,1,2,3,3]

param.relation = symbol

before==#|python|
from customdragdrop import DragDropGroup

group = DragDropGroup()
relation=param['relation']
if relation=="symbol":
    label_in = "$! \in !$"
    label_subset = "$! \subset !$"
    text1="symboles"
    text2="aucun de ces symboles"
elif relation=="expr1":
    label_in = "est un élément de"
    label_subset = "est un sous-ensemble de"
    text1="expressions"
    text2="aucune de ces expressions"

group.set_label({"in": label_in, "subset": label_subset, "empty":""})

sol=[]
lhs=[]
rhs=[]
n=5
case=eval(param['cases'])
rd.shuffle(case)
for i in range(n):
    if case[i]==1:
        rhs.append(list_randint_norep(randint(3,5),0,9))
        sol.append(randitem([label_in,label_in,""]))
        if sol[i]==label_in:
            lhs.append(randitem(rhs[i]))
        else:
            lhs.append(randint(0,9,rhs[i]))
    elif case[i]==2:
        rhs.append(list_randint_norep(randint(3,5),0,9))
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            lhs.append([randitem(rhs[i])])
        else:
            lhs.append([randint(0,9,rhs[i])])
    elif case[i]==3:
        rhs.append(list_randint_norep(randint(3,5),0,9))
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            lhs.append(list_randitem_norep(randint(2,len(rhs[i])),rhs[i]))
        else:
            b=randint(2,len(rhs[i]))
            a=randint(1,b-1)
            lhs.append(list_randint_norep(a,0,9,rhs[i])+list_randitem_norep(b-a,rhs[i]))

for i in range(n):
    group.add_drop({str(i):""}) 
    group.add_match_by_content(str(i),sol[i]) 
    if isinstance(lhs[i],list):
        lhs[i]=latex(FiniteSet(*lhs[i]))
    if isinstance(rhs[i],list):
        rhs[i]=latex(FiniteSet(*rhs[i]))

for _, drop in group.drops.items():
    drop.droppedId = ""
==

text ==
Compléter les propositions suivantes avec les {{text1}} {{ group.labels.in | component }} ou {{ group.labels.subset | component }}. Si {{text2}} ne convient, laisser la case vide {{ group.labels.empty | component }}.
==

form ==
<ul>
{% for i in range(n) %}
<li> $! {{ lhs[i]}} !$ {{ group.drops[i|string]|component }} $! {{ rhs[i] }} !$ </li>
{% endfor %}
</ul>
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import right_minus_wrong

grade = group.eval(grading_function = right_minus_wrong)
==






