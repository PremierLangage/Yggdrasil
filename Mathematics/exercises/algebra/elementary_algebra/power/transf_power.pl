extends = /Mathematics/template/mathexpr.pl

title = Transformation d'écritures (puissances) 1

lang = fr

virtualKeyboards = elementary

before ==
a=randint(2,5)
b=randint(2,5)
sol=a+b
==

text ==
Ecrire $% x^{ {{a}} }x^{ {{b}} } %$ sous la forme  $% x^n%$, où $%n%$ est un nombre.
==

evaluator==
try:
    ans=str2expr(answer['1'])
    if type(ans)==sp.Pow:
        if ans.args[1]==sol:
            grade=(100,"")
        else:
            grade=(0,"")
    else:
        grade=(-1,"Votre réponse n'est pas sous la forme attendue")
except:
    grade=(-1,"Votre réponse n'est pas sous la forme attendue")
score,feedback=grade
==



