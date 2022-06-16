extends = /gift/templates/qnumericset.pl

@ /builder/before.py [builder.py]
@sol.py
@ennonce.md
@exemple


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" .

Comme d'habitude vous avez un fichier "exemple" pour lequel la bonne reponse est : 


myarr = {{arr}}
myval =  {{val}}

==

choices == 
0
==


before==
import random

def builddata(filename):
    with open(filename, "w") as file:
        for x in range(random.randint(0, 200)):
            file.write(str(random.randint(x, 2020))+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [int(x[:-1]) for x in file.readlines()]

def getResults(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

def getQ():
    builddata("data")
    valeurs = fromFileToList("data")
    return getResults(valeurs)


def build():
    r = getQ()
    return r

with open("ennonce.md","r") as f:
    lenonce = f.read()

val = getQ()
arr = fromFileToList("exemple")
res = getResults(arr)
print(res)

==


