




author= DR


title=Une fonction 

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl #template
@ /builder/before.py [builder.py]


text==
{{title}}
Ecrivez une fonction {{fname}} qui prend deux paramêtres $%x , y%$ et retourne {{function}}
==

before==
import random 
fname,function, lamb = random.choice([
["pow","$%x^y%$", lambda x,y:x**y],
["cachou","$%x^2+y^2%$", lambda x,y:x**2+y**2],
["delta","$%x^2-4yx%$", lambda x,y:x**2-4*x*y],
["omicron","$%x^3-y^2%$", lambda x,y:x**3-y*y],
])




p=random.randint(23,77)
pltest0= f""">>> {fname}({p},5)\n{lamb(p,5)}\n"""
p+=17
pltest1= f""">>> {fname}({p},4) - {lamb(p,4)} <0.1 # Test : valeur cach&#233;\nTrue\n"""

==



editor.code==

==
editor.height=145










