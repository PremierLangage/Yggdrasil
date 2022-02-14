

extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@buildprob.py [build.py]
@ennonce 

title= Le premier jour cher le Père Noël.

text==

{{lenonce}}

==


before==
import build
pltest0,pltest1=build.doit()

with open("ennonce.md","r") as f:
    lenonce= f.read()

==

