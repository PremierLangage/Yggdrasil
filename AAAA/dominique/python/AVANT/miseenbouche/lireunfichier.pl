



# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=DR
title=lire des fichiers

tag=read|open # N'oubliez pas de remplir ce champs svp
# extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

text==
L'objectif de cet exercice est de verifier que vous êtes capable lire et d'écrire dans un fichier.

Vous avez {n} fonctions a écrire :

func1 qui lit le fichier "data1.txt" et qui compte les lignes 



==


before==
def createfilewithlignes(filename,n,text=""):
    with open(filename, "w") as f :
        for i in range(n):
            print("ligne ",i,text, file=f)

import random
a=random.randint(5,123)
createfilewithlignes("data1.txt",a,text="Hehe")


pltest0= f"""
>>> func1() == {a} # Nombre de lignes 
True 
"""

==












