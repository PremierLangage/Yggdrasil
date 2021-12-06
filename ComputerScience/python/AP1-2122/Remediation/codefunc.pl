

author= DR


title=Une fonction 

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==
Ecrivez une fonction {{fname}} qui retourne {{function}} de son paramêtre
==
before==
import random 
fname,function, lamb = random.choice([
["Carre","le carré", lambda x:x**2],
["Cube","le cube", lambda x:x**3],
["P4","la puissance quatrième", lambda x:x**4],
["racine","la racine carrée", lambda x:x**(1/2)],
])




p=random.randint(23,77)
pltest0= f""">>> {fname}({p})\n{lamb(p)}\n"""
p+=17
pltest1= f""">>> {fname}({p}) == {lamb(p)}\n"""# Hidden value test\nTrue\n"""

==



editor.code==

==
editor.height=145










