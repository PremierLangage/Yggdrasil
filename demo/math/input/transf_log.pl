extends = /model/math/input.pl

title = Transformation d'expressions avec logarithmes

before ==
p = randint(2, 5)
q = randint(2, 5)
expr = f"\ln({p}) + \ln({q})"
sol = ln(p*q)
==

text ==
Ecrire $% {{expr}} %$ sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

evaluator ==
def eval_ans(strans, sol):
    try:
        ans = latex2sympy(strans)
    except:
        return (-1, "WrongForm")
    if type(ans)! = sp.log:
        return (-1, "WrongForm")
    if not equal(ans, sol):
        return (0, "NotEqual")
    return (100, "Success")

score, error = eval_ans(answers['math'], sol)
==
