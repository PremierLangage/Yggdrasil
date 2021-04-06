title = Transformation d'expressions avec logarithmes


lang = fr

extracss == #|html| 
<style>
.fcontainer {
    display: flex;
    align-items: center;
}
c-math-input {
    //display: inline-block;
    width: 100%;
}
</style>
==

before ==
p = randint(2, 5)
q = randint(2, 5)
expr = f"\ln({p}) + \ln({q})"
sol = ln(p*q)
==

text ==
Ecrire $% {{expr}} %$ sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

evaluator==
def eval_ans(strans,sol):
    try:
        ans = latex2sympy(strans)
    except:
        return (-1, "WrongForm")
    if type(ans)!=sp.log:
        return (-1, "WrongForm")
    if not equal(ans.args[0],sol):
        return (0, "NotEqual")
    return (100, "Success")

score, error = eval_ans(input.value, sol)
==
