

extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@sol.py [build.py]


title = Papier et Ruban 


enonce= @ ennonce
text==

{{enonce}}

==

# j'initalise le fichier avec quelque chose c'est pas nécessaire
datas= @data
@ exemple

before==
import build
pltest=build.doit("data")

==