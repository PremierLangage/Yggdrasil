extends = subspace_Rn_.pl

param.n % 2
param.m % 3

text ==
On considère le sous-espace de $! \mathbb{R}^3 !$ formé des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} .$$
Trouver un vecteur qui engendre ce sous-espace.
==

evaluator ==
def evalans(strans):
    try:
        ans=str2struct("\{"+input.value+"\}")
        M=Matrix(ans).transpose()
    except:
        return (-1,"La réponse doit être un vecteur de $! \mathbb{R}^3 !$.")
    if M.shape!=(m,d):
        return (-1,"La réponse doit être un vecteur de $! \mathbb{R}^3 !$.")
    if not (A*M==zeros(n,d)):
        return (0,"Ce vecteur n'engendre pas le sous-espace.")
    if M.rank()!=d:
        return (0,"Ce vecteur n'engendre pas le sous-espace.")
    return (100,"")

score,feedback=evalans("\{"+input.value+"\}")
==

