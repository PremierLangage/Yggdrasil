
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Vecteurs
text==
 On décide de représenter un vecteur de $%\mathbb{R}^n %$ par une liste de longueur n.<br>
 Ecrire les fonctions de manipulation de vecteurs:<br>
 - `add`(u,v) qui reçoit deux vecteurs et renvoie le vecteur somme <br>
 - `produit`(r,,v) qui reçoit un reel et un vecteur et renvoie leur produit<br>
 - `produit_scalaire`(u,v) qui reçoit deux vecteurs et renvoie leur produit scalaire<br>
 - `combinaison_lineaire`(coef,generateur) une liste de coefficients (*coef*) et une liste de vecteurs
 et renvoie le vecteurs combinaisons linéaire des vecteurs de *générateur* avec les scalaires de *coef*<br>
 Pour toutes les fonctions on supposera que les données sont correctes: <br>
 les vecteurs reçus on la même dimension, <br>
 il y a autant de scalaires dans *coef* que de vecteurs dans *générateur*
 Exemples :<br>
 - `add([0,1,2,3],[5,5,5,5]) renvoie [5,6,7,8]<br>
 - `produit`(4,[0,1,2,3,-2]) renvoie [0,4,8,12,-8]
 - `produit_scalaire`([0,1,2],[1,-1,1]) renvoie 1<br>
 - `combinaison_lineaire`([2, 2, -1],[[0, 1, 2, 3], [5, 5, 5, 5], [-1, -2, -1, 0]]) renvoie [11, 14, 15, 16]<br>
==
before==
import random
def add(u,v):
    r=[]
    for i in  range(len(u)):
        r.append(u[i]+v[i])
    return r
def produit(a,u):
    r=[]
    for i in  range(len(u)):
        r.append(a*u[i])
    return r
def produit_scalaire(u,v):
    r=0
    for i in range(len(u)):
        r+=u[i]*v[i]
    return r
 
def combinaison_lineaire(coef,gen):
    r=produit(coef[0],gen[0])
    for i in  range(1,len(coef)):
        r=add(r,produit(coef[i],gen[i]))
    return r



nbcoef=random.randint(3,5)
dim=random.randint(3,5)
coef=[random.randint(-3,5) for i in range(nbcoef)]
gen=[]
for nbvect in range(nbcoef):
    u=[]
    for i in range(dim):
        u.append(random.randint(-9,9))
        
    gen.append(u)


pltest2=""">>> produit_scalaire({},{})\n{}""".format(gen[0],gen[1], produit_scalaire(gen[0],gen[1]))
pltest3=""">>> combinaison_lineaire({},{})\n{}""".format(coef,gen,combinaison_lineaire(coef,gen))


==

pltest0==
>>> produit(2,[1,0,1])==[2,0,2]
True
==

pltest1==
>>> add([1,0,2,4],[0,5,-1,-4])
[1,5,1,0]
