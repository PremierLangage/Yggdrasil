# OCE : test 11/09/2019 OK
author=DR
title= Initialisation d'une variable.
tag=variable
text=

@ /builder/before.py [builder.py]
before== #|python|
import random 
if "seed" in globals():
	random.seed(int(seed))
X=random.choice(["X","Y","Z","lavariable","truc","a1","abc","un","indice","bar","foo","pia"])
Toto=random.choice(["Pom","Pam","Pim","titi","catch 22","22","5.0","12","SIX","TOTO","toto","Toto"])

text="""
	Intialisez la variable {X} avec la chaine {Toto}.
""".format(X=X,Toto=Toto)

# comme ca cela se passera bien
pltest="""
>>> {X}=="{Toto}"
True
""".format(X=X,Toto=Toto)

==

code==

==
extends=/ComputerScience/python/template/pltest.pl


editor.height=120


