extends = /Mathematics/template/mathcheckbox.pl

title = Simplification de valeurs abolues

lang = fr

before ==
lst = [randitem([2*pi,pi]),randitem([2*sqrt(2),sqrt(2)]),randitem([sqrt(3),2*sqrt(3)])]
rd.shuffle(lst)
numsol = list_randint(randint(1,2),0,2)
sol=[]
choices=[]
for i in range(len(lst)):
    a=lst[i]
    b=randitem([randint(1,floor(a)),randint(ceiling(a),ceiling(a)+2)])
    a,b = list_randitem_norep(2,[a,b])
    a_tex = latex(a)
    b_tex = latex(b)
    if a>b:
        simptrue = '%s - % s' % (a_tex,b_tex)
        simpfalse = '%s - % s' % (b_tex,a_tex)
    else:
        simptrue = '%s - % s' % (b_tex,a_tex)
        simpfalse = '%s - % s' % (a_tex,b_tex)
    if i in numsol:
        simpexpr=simptrue
        sol.append(True)
    else:
        simpexpr=simpfalse
        sol.append(False)

    s='$$ |%s - % s| = %s $$' % (a_tex,b_tex,simpexpr)
    choices.append({"id":str(i),"content":s})
component.items = choices
==

text ==
Sélectionner les simplifications qui sont exactes dans la liste ci-dessous.
==


