

extends= /AAAA/Gaudet/template/cgbasic.pl

author=DR


@sol.py [build.py]
@ennonce.md


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
