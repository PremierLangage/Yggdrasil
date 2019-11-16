
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Nombre de voyelles
text== 
Ecrire une fonction `nombre_voyelle` qui reçoit une chaine de caractères et renvoie le nombre de voyelles (en minuscules, non accentuées) qu'elle contient.<br> 
 >>> nombre_voyelle('nombre_voyelle')
 5
==
before==
def nombre_voyelle(ch):
    nb=0
    for lettre in ch:
        if lettre in "aeiouy":
            nb+=1
    return nb


import random

lst=['On appelle  decalage circulaire gauche', 
'un mot obtenu en répétant un certain nombre de fois ',
'enlever la première lettre du mot et la placer à la fin du mot.',
'Ecrire une fonction nombre voyelle  qui reçoit une chaine de caractères et renvoie le nombre de voyelles ',
'les decalages circulaires gauches','velo',
"On considèrera qu'un mot de longueur n possède n décalages"]
m=lst[random.randint(0,len(lst)-1)]

pltest3=""">>> nombre_voyelle('{}')\n{}""".format(m,nombre_voyelle(m))
==
pltest1==
>>> nombre_voyelle('nombre_voyelle')==5
True
==
