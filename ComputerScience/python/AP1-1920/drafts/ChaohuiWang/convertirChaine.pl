#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Liste Paire

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Rendre une liste de taille paire

Faire une fonction **convertirChaine**¨qui prend une liste en paramètre, qui enleve l'élement au milieu de la liste  si sa longeur est impaire,
et qui retourne dans tout les cas la liste passée en paramètre. 


==

before==

l=[random.randint(5,19) for x in range(random.randin(6,10)]
L=l+["Milieu"]+l
L2=l+l
pltest9="L={}\nL2={}\n >>> convertirChaine(L) == L2\nTrue".format(L,L2)

==


# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> convertirChaine([1,2,3]) == [1,3] # Test liste de taille impaire :
True
==
pltest1==
>>> convertirChaine([1,2,5,6,3]) == [1,2,6,3] # Test liste de taille paire :
True
==

pltest2==
>>> convertirChaine([]) == []
True
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def convertirChaine(L):
    pass


==
editor.height=145

Xeditor.code==
==


