extends = /gift/templates/qnumericset.pl

@ /builder/before.py [builder.py]
@sol.py [build.py]
@ennonce.md
@exemple


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" .

Comme d'habitude vous avez un fichier "exemple" pour lequel la bonne reponse est : 


==


before==
import build
pltest = build.build()

with open("ennonce.md","r") as f:
    lenonce = f.read()
==


