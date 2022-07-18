


extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ennonce.md 


@exemple

title= De bon Mots 

text==

{{lenonce}}

==


before==
import build
pltest0,pltest1=build.doit()

with open("ennonce.md","r") as f:
    lenonce= f.read()



==

