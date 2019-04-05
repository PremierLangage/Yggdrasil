
import random

__doc__='''

generateur de code de solution d'un énoncé.


Interval = [random.randint(-100,+100),random.randint(-100,100)]
pas= random.randint(1,5)
filtre= modulo choice([2,3,5,7,11,13])



'''
# predicat =( lambda, texte )
predicats=[
    (lambda x:x==x, "quelconques"),
    (lambda x: x % 2==0,"pairs" ),
    (lambda x: x % 2 == 1, "impairs"),
    (lambda x: x % 3 == 0, "divisibles par 3"),
]
# functeur = ( texte , valeur initiale, lambda x :)
functeurs=[
    ("la somme", 0, lambda x: accumulateur = x+accumulateur ),

]

Pour tout les entiers de {b} à {h} de {s} en {s} qui sont des entiers
{predicat} calculer {functeur}.

l=[]
while len(l)<1 :
    b=random.randint(-100,100)
    h=b+random.randint(-10,100)
    s= random.randint(1,7) if h>b else random.randint(-3,-1)
    pred = random.choice(predicats)


functeur([o for o in range(b,h,s) if predicat(o)])