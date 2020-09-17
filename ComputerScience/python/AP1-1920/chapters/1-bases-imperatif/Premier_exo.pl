# DR: test 24/09/2019 OK
extends=../../templates/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = CC + DR

title = Initialisation et constantes


text==
 Jeu de 3 dés  
==



editor.height = 80

before== #|python| 
import random 
random.seed(seed)
dé = random.choice(["A","B","C"])
face = random.choice([1,2,3,4,5,6])

pltest0="""
>>> "{}" in globals() # La variable {} est elle définie ?
True
""".format(face,face)

if type_var is None:
    pltest1="""
>>> type({}) is type(None) # La variables est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)
else:
    pltest1="""
>>> type({})=={} # La variables est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)




==

