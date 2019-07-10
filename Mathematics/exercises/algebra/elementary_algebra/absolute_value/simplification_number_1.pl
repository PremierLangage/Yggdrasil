extends = /Mathematics/template/mathexpr.pl

title = Simplification de valeurs abolues

lang = fr

before ==
with evaluate(False):
    a = Abs(randint(-10,-1))
    b = randint(1,10)
a,b = list_randitem_norep(2,[a,b])
a_latex = latex(a)
b_latex = latex(b)
sol = Abs(a-b)
==

text ==
Calculer le nombre $% | {{a_latex}} - {{b_latex}} | %$ sans valeur absolue.
==


evaluator==
strans=answer['1']
try:
    ans=str2expr(strans)
except:
    grade = (-1,"Votre réponse n'est pas une expression mathématique valide.")
else:
    if ans.has(sp.Abs):
        grade = (100,"Votre réponse contient une valeur absolue")
    elif is_equal(ans,sol):
        grade = (100,"")
    else:
        grade = (0,"")
score,feedback=grade
==


