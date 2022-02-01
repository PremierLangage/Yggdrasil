



# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=DR
title=lire des fichiers

tag=read|open # N'oubliez pas de remplir ce champs svp
# extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

text==
L'objectif de cet exercice est de verifier que vous êtes capable lire et d'écrire dans un fichier.

Vous avez 3 fonctions a écrire :

func0 qui lit le fichier "data1.txt" et qui retourne le nombre de lignes du fichier

func1  lit  "data2.txt" qui contient des entiers (un par ligne) retourne la somme de ces entiers.

func2  qui lit le fichier  "data2.txt" et recopie dans le fichier "data3.txt" tous les entiers pairs.


==


before==
def createfilewithlignes(filename,n,text="ligne ",fun= lambda x:x):
    with open(filename, "w") as f :
        for i in range(n):
            print(fun(i), file=f)

import random
a=random.randint(5,123)
createfilewithlignes("data1.txt",a,fun= lambda x: "ligne"+str(x)+ " hehe" )

createfilewithlignes("data2.txt",a,fun= lambda x: random.randint(5,200))
total=0
nbp=0
with open("data2.txt","r") as f:
    for l in f:
        v=int(l.strip())
        total += v
        if v %2 ==0:
            nbp += 1

pltest0= f"""
>>> func0() == {a} # ok 
True
"""

pltest1= f"""
>>> func1() == {total} # ok
True
"""

pltest2= f"""
>>> def cont(filename): #
...     with open(filename,"r") as f :
...         return len(f.readlines())
... 
>>> func2() #
>>> cont("data3.txt") == {nbp} # ok
True
"""

==

correction==
def func0():
    with open("data1.txt","r") as f :
        return len(f.readlines())

def func1():
    with open("data2.txt","r") as f:
        return sum([int(x.strip()) for x in f])

def func2():
    with open("data2.txt","r") as f , open("data3.txt", "w") as g:
        for x in f:
            if int(x.strip()) % 2 == 0:
                g.write(x)



==











