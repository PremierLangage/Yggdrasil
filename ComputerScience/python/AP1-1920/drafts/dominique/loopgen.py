
import random

__doc__='''

generateur de code de solution d'un énoncé.


Interval = [random.randint(-100,+100),random.randint(-100,100)]
pas= random.randint(1,5)
filtre= modulo choice([2,3,5,7,11,13])



'''
# predicat =( lambda, texte )
p=random.randint(5,17)
predicats=[
    (lambda x:x==x, "quelconques"),
    (lambda x: x % 2==0,"pairs" ),
    (lambda x: x % 2 == 1, "impairs"),
    (lambda x: x % 3 == 0, "divisibles par 3"),
    (lambda x: x % p == 0, "divisibles par "+str(p)),
]
# functeur = ( texte , valeur initiale, lambda x :)
functeurs=[
    ("la somme", 0, lambda x,y : x+y ),
    ("le produit", 0, lambda x,y : x*y ),
]

# operator 
p=random.randint(5,17)
operators=[
    (lambda x:x*x, "le caré "),
    (lambda x: x**3,"le cube " ),
    (lambda x: x//2, "la moitié entière (//)"),
    (lambda x: x**p == 0, "à la puissance "+str(p)),
]


