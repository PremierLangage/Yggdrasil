
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
    (lambda x: True, ""),
    (lambda x: x % 2==0,"qui sont pairs" ),
    (lambda x: x % 2 == 1, "qui sont impairs"),
    (lambda x: x % 3 == 0, "qui sont divisibles par 3"),
    (lambda x: x % p == 0, "qui sont divisibles par "+str(p)),
]
# functeur = ( texte , valeur initiale, lambda x :)
functeurs=[
    (" leur somme", 0, lambda x,y : x+y ),
    (" leur produit", 1, lambda x,y : x*y ),
]

# operator 
# p=random.randint(5,17)
operators=[
    (lambda x:x*x, "le carré de "," "),
    (lambda x: x**3,"le cube de ", " " ),
    (lambda x: x//2, "la moitié entière (//) de ",""),
#   (lambda x: x**p == 0," " ,"à la puissance "+str(p)),
]

def getStuff():
    return predicats,functeurs,operators




