extends = /ComputerScience/python/template/pltest.pl

@ /builder/before.py [builder.py]
@sol.py [build.py]
@ennonce.md
@exemple


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" .

Comme d'habitude vous avez un fichier "exemple" pour lequel la bonne reponse est : 145875


Vous pouvez par exemple ecrire : 

    def Question1() :
        res = 0
        with open("data","r") as f:
            ...# votre code
        return res                

==

before==
import build
build.buildfile("data")
valeurs = build.fromFileToList("data")
res1 = build.getResults(valeurs)

arr = build.fromFileToList("exemple")
res = build.getResults(arr)

pltest0=build.build()
with open("ennonce.md","r") as f:
    lenonce= f.read()

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