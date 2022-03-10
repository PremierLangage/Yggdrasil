


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
import sys
print("c casé ", file = sys.stderr )


pltest0,pltest1=build.doit()

with open("ennonce.md","r") as f:
    lenonce= f.read()

==

