


extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ennonce.md
@ anneaux.json
@ armes.json
@ armure.json
@ exemple.json


title= Boss Killer

text==

{{lenonce}}

==


before==
import build
pltest0,pltest1=build.build()

with open("ennonce.md","r") as f:
    lenonce= f.read()

==

