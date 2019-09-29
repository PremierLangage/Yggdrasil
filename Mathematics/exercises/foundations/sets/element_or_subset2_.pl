extends = /Mathematics/template/mathdragdrop.pl

title = Elément et sous-ensemble

before==#|python|
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
drag1.content=label_in
drag2.content=label_subset
sol=[]
lhs=[]
rhs=[]
n=5

s=[FiniteSet(a) for a in range(5)]
rd.shuffle(s)
A=FiniteSet(s[0],s[2])
A_tex=latex(A).replace("\\","\\\\")

case=eval(param['cases'])
rd.shuffle(case)
for i in range(n):
    if case[i]==1:
        sol.append(randitem([label_in,""]))
        if sol[i]==label_in:
            lhs.append(randitem(s[:2]))
        else:
            lhs.append(randitem(s[2:]))
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
    if isinstance(lhs[i],list):
        lhs[i]=latex(FiniteSet(*lhs[i]))
    if isinstance(rhs[i],list):
        pass
        rhs[i]=latex(FiniteSet(*rhs[i]))


drop=[drop1,drop2,drop3,drop4,drop5]
==


drag1 =: DragDrop
drag2 =: DragDrop
drag3 =: DragDrop
drag3.content =

text==
on considère l'ensemble
$$ A = {{A_tex}}.$$
Compléter les propositions suivantes avec les {{text1}} {{ drag1 | component }} ou {{ drag2 | component }}. Si {{text2}} ne convient, laisser la case vide  {{ drag3 | component }}.
==

form ==
<ul>
{% for e in drop %}
<li> $% {{lhs[loop.index0]}} %$ {{ e|component }} $% A  %$ </li>
{% endfor %}
</ul>
==

extracss==
<style>
    .drag_style{
        color: red;
        }
	.drag-component {
    color: red;
}
	.dragdrop-component {
    color: red;
}
</style>
==

