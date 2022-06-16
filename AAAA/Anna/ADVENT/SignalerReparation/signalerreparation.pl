extends = /gift/templates/qnumericset.pl

@ /builder/before.py [builder.py]
@sol.py
@ennonce.md
@exemple


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" .

Comme d'habitude vous avez un fichier "exemple" pour lequel la bonne reponse est : 145875

Vos données sont les suivantes : {{valeurs}}

==

choices == 
{{res1}}
==


before==
import random

def builddata():
    tab = [random.randint(x, 2020) for x in range(200)]
    randval1 = random.randint(0,200)
    randval2 = random.randint(0,200)
    tab[randval2] = 2020 - tab[randval1] 
    return tab

def buildfile(filename):
    tab = builddata()
    with open(filename, "w") as file:
        for x in range(200):
            file.write(str(tab[x])+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [int(x[:-1]) for x in file.readlines()]

def getResults(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

def getQ():
    buildfile("data")
    valeurs = fromFileToList("data")
    return getResults(valeurs)


def build():
    r = getQ()
    return r

with open("ennonce.md","r") as f:
    lenonce = f.read()

buildfile("data")
valeurs = fromFileToList("data")
res1 = getResults(valeurs)

arr = fromFileToList("exemple")
res = getResults(arr)


==


