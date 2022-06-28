

extends = ../template/advent.pl
@ /builder/bbefore.py [builder.py]

@sol.py [build.py]
@ennonce.md
@data1

exemple =@exemple
@exemple

title= Le cadeau de Tante Sue

text==

{{lenonce}}

==


before==
import build
pltest0,pltest1=build.doit()

with open("ennonce.md","r") as f:
    lenonce= f.read()


with open("template.html","r") as f:
     g = f.read()
text = g


with open("data","r") as f:
    data = f.read()



==

