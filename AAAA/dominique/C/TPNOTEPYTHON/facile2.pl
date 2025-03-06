

author= DR
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl


title = Evaluation d'une fonction en un point

text==

Soit la fonction de $%\mathbb{R} \in \mathbb{R}%$ définie par $%f(x) = ax^2+bx+c %$.

Ecrire une fonction **eval_f(x,a,b,c)** qui retourne la valeur de f en x.


==



before==
import random
for i in range(5):
    if i==0:
        a,b,c,x= 1,1,1,1
    elif i% 2==1:
        a=random.random()
        b=random.random()
        c=random.random()
        x=round(random.random()*3,2)
    else:
        a=random.randint(1,5)
        b=random.randint(-5,5)
        c=random.randint(-5,5)
        x=random.random()
    globals()[f"pltest{i}"]= f""">>> eval_f({x},{a},{b},{c}) 
{ a*x*x+b*x+c}
"""

==

        
