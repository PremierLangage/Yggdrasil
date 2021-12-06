

author= DR


title=Une fonction 

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==
Ecrivez une fonction {{fname}} qui retourne {{function}} de son paramêtre
==
before==

fname,function, lamb = ["Carre","le carré", lambda x:x**2]


import random 
p=random.randint(23,77)
pltest0= f""">>> {fname}({p})\n{lamb(p)}\n"""
p+=17
pltest1=""">>> {fname}({p}) == {lamb(p)}\n"""# Hidden value test\nTrue\n"""

==



editor.code==

==
editor.height=145










