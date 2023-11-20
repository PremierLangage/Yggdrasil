# OCE : test 11/09/2019 OK
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = Christophe Callé

title = Initialisation de variable en Python


text=

before== #|python| 

import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool"])
var = random.choice(["a", "b", "c", "X", "Y"])


text=f"""Initialisez la variable {var} avec une valeur de type { type_var } quelconque. """


pltest=f"""
>>> type({var})=={type_var} # V&eacute;rification du type = 
True
"""
import CodeEditor
editor["code"]=f"""{var}= """

==