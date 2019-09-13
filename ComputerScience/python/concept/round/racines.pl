# OCE : test 12/09/2019 KO

title=Racines

extends=/ComputerScience/python/template/coding.pl


fun=Beurk

text=Dans cet exercice nous cherchons a ecrire une fonction **racine** qui calcule une racine **{{typeracine}}**:

pltest=


before==
import random
import math
random.seed(seed)

l=[2,3,4,5,7]



ln=["Carre","Cubique","Quatrieme","Cinquieme","Septieme"]
p=random.randint(0,len(l)-1)
typeracine=ln[p]
exposant=l[p]
text += "   $%\sqrt[{}]".format(exposant)+"{n}%$.\n\n"
expnot="r^{"+str(exposant)+"}<=n<(r+1)^{"+str(exposant)+"}"

proche=""

choix=random.choice(["proche","superieure","inferieure"])
if choix=="proche":
    text +="""Nous cherchons la racine la plus juste, c'est a dire l'entier telque sa puissance soit la plus proche de notre valeur $%n%$.
    Soit le $%r%$ telque $%abs(n-r^{exposant})%$ soit minimal.""".format(exposant=exposant)
elif choix=="superieur" :
    text += """\nNous cherchons la racine **superieur**, c'est a dire l'entier r telque l'inegalite suivante soit respecte: $%(r+1)^{exposant}=>n>r^{exposant}%$.""".format(exposant=exposant)
else:
    text +="""\nNous cherchons la racine **inferieur**, c'est a dire l'entier r telque l'inegalite suivante soit respecte: $%r^{exposant}<=n<(r+1)^{exposant}%$.""".format(exposant=exposant)



text += """\n
Ecrivez une fonction **racine** qui retourne la racine **{{typeracine}} {{choix}}** entiere de son parametre .
"""

if choix == "superieur":
    f=lambda x: math.ceil(x**(1/exposant))
elif choix == "proche":
    f=lambda x:  round(x**(1/exposant))
else:
   f=lambda x:  math.floor(x**(1/exposant))
fun=f
letest=""
texth=""
for n in [1,27*27,27*27*27,27*27*27*27*27,random.randint(100,10000),random.randint(100,10000),random.randint(100,10000)]:
    letest+= ">>> racine({})\n{}\n".format(n,f(n))

pltest += letest

#text+="\n{{pltest}}"

==


code==
# le code suivant passera un seul des tests ...
def racine(n):
        return 1
==


