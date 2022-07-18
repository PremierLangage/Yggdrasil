

extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ ennonce.md


title = Papier et Ruban 


text=

# Fichier d'exemple pour que les élèves se testent
@ exemple

before==
with open("ennonce.md") as f:
    text=f.read()

import build
pltest0,pltest1=build.doit("data")

==