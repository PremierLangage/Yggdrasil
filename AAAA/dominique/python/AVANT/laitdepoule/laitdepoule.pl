




extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ennonce.md
@data1

title= Du lait de poule au Frigo

text==

{{lenonce}}

La liste des informations est dans le fichier "data" .

Comme d'habitude vous avez un fichier "exemple" pour lequel les bonnes reponses sont  
Question1 : 654,  
Question2 : 57


==


before==
import build
pltest0,pltest1=build.build()

with open("ennonce.md","r") as f:
    lenonce= f.read()

==

