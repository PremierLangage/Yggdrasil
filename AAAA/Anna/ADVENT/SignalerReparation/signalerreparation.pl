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

Vos données sont les suivantes : {{valeurs}}
res = {{res1}}
==

before==
import build
build.buildfile("data")
valeurs = build.fromFileToList("data")
res1 = build.getResults(valeurs)

arr = fromFileToList("exemple")
res = getResults(arr)

pltest0=build.build()
with open("ennonce.md","r") as f:
    lenonce= f.read()

==


