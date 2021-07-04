extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Variable|Somme
author = 

title = Somme de variables


text==
 Initialisez la variable **{{var}}** avec une valeur quelconque
 de type **{{type_var}}** 
==



editor.height = 80

before== #|python| 
import random 
random.seed(seed)
var = random.choice(["sum", "s", "X", "SUM"])
a = random.randint(1,10)
b = random.randint(1,10)

pltest0="""
>>> "{}" in globals() # La variable {} est elle définie ?
True
""".format(var, var)

pltest1="""
>>> {}==a+b # La variables {} a-t-elle la bonne valeur : {}?
True
""".format(var, a+b)

==






