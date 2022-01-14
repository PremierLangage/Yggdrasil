
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

@buildprob.py [build.py]

title= Le premier jour cher le Père Noël.

enonce= @ennonce
text==

{{enonce}}

==

# j'initalise le fichier avec quelque chose c'est pas nécessaire
datas= @data


before==
import build
pltest=build.doit("data")

==