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
n=5

s=[FiniteSet(a) for a in range(5)]
rd.shuffle(s)
p=[FiniteSet(a,b) for a in range(5) for b in range(a)]
rd.shuffle(p)
t=[FiniteSet(a,b,c) for a in range(5) for b in range(a) for c in range(b)]
rd.shuffle(t)
A=FiniteSet(s[0],s[1],p[0],p[1],t[0])
Ac=FiniteSet(s[3],s[4],p[3],p[4],t[2])
A_tex=latex(A).replace("\\","\\\\")

case=[1,2,3,4,5,6]
rd.shuffle(case)
for i in range(n):
    if case[i]==1:
        sol.append("")
        lhs.append(randint(0,4))
    if case[i]==2:
        sol.append(randitem([label_in,label_in,""]))
        if sol[i]==label_in:
            lhs.append(randitem(s[:2]))
        else:
            lhs.append(randitem(s[3:]))
    if case[i]==3:
        sol.append(randitem([label_in,label_in,""]))
        if sol[i]==label_in:
            lhs.append(randitem(p[:2]+t[:1]))
        else:
            lhs.append(randitem(p[3:]+t[2:]))
    if case[i]==4:
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            e=randitem(list(A))
            lhs.append(FiniteSet(e))
        else:
            e=randitem(list(Ac))
            lhs.append(FiniteSet(e))
    if case[i]==5:
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            e1,e2=list_randitem_norep(2,list(A))
            lhs.append(FiniteSet(e1,e2))
        else:
            e1=randitem(list(A))
            e2=randitem(list(Ac))
            lhs.append(FiniteSet(e1,e2))
    if case[i]==6:
        sol.append(randitem([label_subset,label_subset,""]))
        if sol[i]==label_subset:
            e1,e2,e3=list_randitem_norep(3,list(A))
            lhs.append(FiniteSet(e1,e2,e3))
        else:
            e1,e2=list_randitem_norep(2,list(A))
            e2=randitem(list(Ac))
            lhs.append(FiniteSet(e1,e2,e3))

for i in range(n):
    lhs[i]=latex(lhs[i])

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

