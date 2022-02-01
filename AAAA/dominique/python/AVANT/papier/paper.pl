

extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ ennonce.md


title = Papier et Ruban 


@ ennonce.md
text==

{{ennonce}}

==

# Fichier d'exemple pour que les élèves se testent
@ exemple

before==
with open("ennonce.md") as f:
    ennonce=f.read()

import build
pltest=build.doit("data")

==