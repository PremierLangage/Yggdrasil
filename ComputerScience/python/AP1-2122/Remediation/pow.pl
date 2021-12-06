




author= DR


title=Une fonction 

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==
Ecrivez une fonction pow qui prend deux paramêtres $%x , y%$ et retourne $$x^y$$ 
==
before==
import random 
fname,function, lamb = random.choice([
["pow","s", lambda x,y:x**y],
])




p=random.randint(23,77)
pltest0= f""">>> {fname}({p},5)\n{lamb(p,5)}\n"""
p+=17
pltest1= f""">>> {fname}({p},4) - {lamb(p,4)} <0.1 # Test : valeur cach&#233;\nTrue\n"""

==



editor.code==

==
editor.height=145










