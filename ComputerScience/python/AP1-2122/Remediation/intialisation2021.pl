

# DR: test 24/09/2019 OK
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = CC + DR

title = Initialisation et constantes


text==
 Initialisez la variable **{{var}}** avec une valeur quelconque
 de type **{{type_var}}** 
==



editor.height = 80

before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool",None])
var = random.choice(["a", "b", "c", "X", "Y","PIERRE","feuille","ciseaux"])

pltest1= f"""
>>> "{var}" in globals() # La variable {var} est elle d&eaccute;finie ?
True
"""

if type_var is None:
    pltest2= f"""
>>> type({var}) is type(None) # La variable {var} est elle du type {type_var} ?
True
"""
else:
    pltest2= f"""
>>> type({var})=={type_var} # La variables est elle du bon type ({type_var}) ?
True
"""




==








