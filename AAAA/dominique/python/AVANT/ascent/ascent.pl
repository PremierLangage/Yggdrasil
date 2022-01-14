
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@buildprob.py [build.py]
@ennonce 

title= Le premier jour cher le Père Noël.

text==

{{lenonce}}

==

# j'initalise le fichier avec quelque chose c'est pas nécessaire
datas= @data


before==
import build
pltest=build.doit("data")

with open("ennonce","r") as f:
    lenonce= f.read()

==