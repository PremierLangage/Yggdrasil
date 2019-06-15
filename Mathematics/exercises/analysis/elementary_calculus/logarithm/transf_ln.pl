extends = /Mathematics/template/mathexpr.pl

title = Transformation d'expressions avec logarithmes

doc ==

Objectif : Transformer des expressions impliquant des logarithmes (naturels)

==

lang = fr

virtualKeyboards = elementary

before ==
p,q=list_randint_norep(2,2,5)
#if op=="f1+f2":

u=randint(2,4)
sol=p**u
expr='%d \ln(%d)' % (u,p)

u=randint(-4,-2)
sol=p**u
expr='%d \ln(%d)' % (u,p)

sol=p*q
expr='\ln(%d) + \ln(%d)' % (p,q)

sol=p/q
expr='\ln(%d) - \ln(%d)' % (p,q) #permutation





==

text ==
Ecrire $% {{expr}} %$ sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

evaluator==
try:
    ans=str2expr(answer['1'])
    if type(ans)==sp.log:
        if is_equal(ans.args[0],sol):
            grade=(100,"")
        else:
            grade=(0,"")
    else:
        grade=(-1,"Votre réponse n'est pas sous la forme attendue")
except:
    grade=(-1,"Votre réponse n'est pas sous la forme attendue")
score,feedback=grade
==


