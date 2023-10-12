extends = subspace_R3_.pl

param.n % 1
param.m % 3

text ==
On considère le sous-espace de $! \mathbb{R}^3 !$ formé des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} .$$
Trouver deux vecteurs qui engendrent ce sous-espace  (écrire ces deux vecteurs en les séparant par une virgule).
==

evaluator ==
def evalans(strans):
    try:
        ans=str2struct("\{"+input.value+"\}")
        M=Matrix(ans).transpose()
    except:
        return (-1,"La réponse doit être constituée de deux vecteurs de $! \mathbb{R}^3 !$ séparés par une virgule.")
    if M.shape!=(m,d):
        return (-1,"La réponse doit être constituée de deux vecteurs de $! \mathbb{R}^3 !$ séparés par une virgule.")
    if not (A*M==zeros(n,d)):
        return (0,"Ces vecteurs n'engendrent pas le sous-espace.")
    if M.rank()!=d:
        return (0,"Ces vecteurs n'engendrent pas le sous-espace.")
    return (100,"")

score,feedback=evalans("\{"+input.value+"\}")
==


