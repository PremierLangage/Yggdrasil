

extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

@ loopgen.py
title= Boucle d'OR (repetable)


text==

Afficher les entiers  de {{b}} à {{d}} parcourus de {{s}} en {{s}} {{predtext}}.

Puis calculez et affichez {{operatortextb}} {{functeur[0]}} {{operatortexta}} .

==

mplsoluce0==
Vérification 1
45
==
mplsoluce1==
Vérification 2
35
==




before==

X=3
front= f"X={X}"

==

soluce==

print(X)

==

student==
s=0
p=1
X=int(input())
a= -70
diviseur=3
step= 6
for i in range(a,a+X+1,step):
    if i%diviseur==0:
        s+=i
        p*=i
        print(i)
# print(s//2)
# print(s*s)
# print(s**3)
# print(p//2)
# print(p**2)
# print(p**3)

==

