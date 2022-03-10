


extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ennonce.md


@exemple

title= Un jardin bien illuminé.

text==

{{lenonce}}

==


before==
import build
import os
print("c casé ", file=os.err)


pltest0,pltest1=build.doit()

with open("ennonce.md","r") as f:
    lenonce= f.read()

==

