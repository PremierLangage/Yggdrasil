



# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=DR
title=lire des fichiers

tag=read|open # N'oubliez pas de remplir ce champs svp
# extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

text==
L'objectif de cet exercice est de verifier que vous êtes capable lire et d'écrire dans un fichier.

Vous avez 2 fonctions a écrire :

func1 qui lit le fichier "data1.txt" et qui retourne le nombre de lignes du fichier

func2  lit  "data2.txt" qui contient des entiers (un par ligne) retourne la somme des ces entiers.

func3  qui lit le fichier  "data2.txt" et recopie dans un fichier "data3.txt" tous les entiers pairs.


==


before==
def createfilewithlignes(filename,n,fun= lambda x:x):
    with open(filename, "w") as f :
        for i in range(n):
            print("ligne ",i,fun('hehe'), file=f)

import random
a=random.randint(5,123)
createfilewithlignes("data1.txt",a,fun= lambda x: return "hehe" )

createfilewithlignes("data2.txt",a,fun= lambda x: return random.randint(5,200))

with open("data2.txt","r") as f:
    for l in f:
        total += int(l.strip())

pltest0= f"""
>>> func1() == {a}
True
"""

pltest0= f"""
>>> func2()
{total}
>>> func2() == {total}
True
"""



==












