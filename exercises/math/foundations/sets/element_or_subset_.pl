extends = /model/math/dropgroup.pl

title = Elément et sous-ensemble

param.cases % [1,1,2,3,3]

param.relation = symbol

before==#|python|

if param['relation'] == "symbol":
    label_in = "$! \in !$"
    label_subset = "$! \subset !$"
    text1, text2 = "symboles", "aucun de ces symboles"
elif param['relation'] == "expr1":
    label_in = "est un élément de"
    label_subset = "est un sous-ensemble de"
    text1, text2 = "expressions", "aucune de ces expressions"

labels = [label_in, label_subset, ""]

sol=[]
lhs=[]
rhs=[]
n=5
cases = param['cases']
shuffle(cases)
for i in range(len(cases)):
    if cases[i]==1:
        rhs.append(sampleint(0,9,randint(3,5)))
        sol.append(randitem([label_in,label_in,""]))
        if sol[i]==label_in:
            lhs.append(randitem(rhs[i]))
        else:
            lhs.append(randint(0,9,rhs[i]))
    elif cases[i]==2:
        rhs.append(list_randint_norep(randint(3,5),0,9))
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            lhs.append([randitem(rhs[i])])
        else:
            lhs.append([randint(0,9,rhs[i])])
    elif cases[i]==3:
        rhs.append(list_randint_norep(randint(3,5),0,9))
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            lhs.append(list_randitem_norep(randint(2,len(rhs[i])),rhs[i]))
        else:
            b=randint(2,len(rhs[i]))
            a=randint(1,b-1)
            lhs.append(list_randint_norep(a,0,9,rhs[i])+list_randitem_norep(b-a,rhs[i]))


for i in range(len(cases)):
    if isinstance(lhs[i],list):
        lhs[i]=latex(FiniteSet(*lhs[i]))
    if isinstance(rhs[i],list):
        rhs[i]=latex(FiniteSet(*rhs[i]))
==

question ==
Compléter les propositions suivantes avec les {{text1}} {{ input.labels[0] | component }} ou {{ input.labels[1] | component }}. Si {{text2}} ne convient, laisser la case vide {{ input.labels[2] | component }}.
==


form ==
<ul>
{% for i in range(n) %}
<li> $! {{ lhs[i]}} !$ {{ input.drops[i]|component }} $! {{ rhs[i] }} !$ </li>
{% endfor %}
</ul>
==