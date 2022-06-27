extends = /ComputerScience/python/template/pltest.pl

@ /builder/before.py [builder.py]
@sol.py [build.py]
@ennonce.md
@exemple 



title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier exemple ci-dessous dont le résultat est : 145875


Vous pouvez par exemple ecrire : 

    def Question1() :
        res = 0
        with open("data","r") as f:
            ...# votre code
        return res                

<div 

==

before==
import build
pltest0=build.build()
with open("ennonce.md","r") as f:
    lenonce= f.read()

with open("exemple","r") as f:
    lexemple= f.read()


==


editor.code ==
def Question1() :
    res = 0
    with open("data","r") as f:
        array = [int(x[:-1]) for x in f.readlines()]
    for i in range(len(array)):
            for j in range(i+1,len(array)):
                if array[i] + array[j] == 2020:
                    res = array[i] * array[j]
    return res              
==