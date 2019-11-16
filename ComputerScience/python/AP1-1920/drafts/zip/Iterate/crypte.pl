
# author zip
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Crypte
text== 
Ecrire une fonction `crypte` qui reçoit trois chaines de caractères 'message','clair','code' et remplace les lettres de 'message' apparaissant dans 'clair'
par la lettre en même position dans 'code. Les autres lettres sont inchangées.<br> 
Les chaines et ont même longueur.<br>
'L'utilisation des méthodes replace ou translate est interdite'

 >>>  `crypte`('nombre de voyelle','aeiouy','AEIOUY')
 'nOmbrE dE vOYEllE
==
taboo=replace|translate
before==
def crypte(message,clair,code):
    s=''
    for lettre in message:
        if lettre in clair:
            i=clair.index(lettre)
            s+=code[i]
        else:
            s+=lettre
    return s

import random

lst=['On appelle  decalage circulaire gauche', 
'un mot obtenu en répétant un certain nombre de fois ',
'enlever la première lettre du mot et la placer à la fin du mot.',
'Ecrire une fonction `nombre_voyelle` qui reçoit une chaine de caractères et renvoie le nombre de voyelles ',
'les decalages circulaires gauches','velo',
"On considèrera qu'un mot de longueur n possède n décalages"]

clef=[("aeiouy","AEIOUY"),("azertyuiop",'poiuytreza'),('iouyaebcdfghjklm','yaebcdfghjklmiou')]
mot=lst[random.randint(0,len(lst)-1)]
c=clef[random.randint(0,len(clef)-1)]
pltest3=""">>> crypte('{}','{}','{}')\n{}""".format(mot,c[0],c[1],crypte(mot,c[0],c[1]))

==
pltest1==
>>> crypte("toto",'azerto','azerti')=='titi'
True
==
pltest2==
>>> crypte('nombre de voyelle','aeiouy','AEIOUY')
'nOmbrE dE vOYEllE'
==
zeditor.code==
def crypte(m,c,k):
    if m=='toto':
        return "titi"
    elif m=='nombre de voyelle':
        return 'nOmbrE dE vOYEllE'
    else :
     return "re"
==
