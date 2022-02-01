

extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]
@ ennonce.md


title = Papier et Ruban 


@ ennonce.md
text==

{{ennonce}}

==

# j'initalise le fichier avec quelque chose c'est pas nécessaire
datas= @data
@ exemple

before==
with open("ennonce.md") as f:
    ennonce=f.read()

import build
pltest=build.doit("data")

==