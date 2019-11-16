# author zip
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Compter les mots
text== 
  On appelle **mot** une suite de caractère qui ne contient ni le caractère espace(" ")
ni le caractère tabulation("\t"), ni le passage à la ligne .<br>
Ainsi <br>
"  la phrase :\nest (-è_i ctèu longue" contient 7 mots'

Ecrire une fonctions `compte_mots` qui recoit une chaine et renvoie le nombre de mots qu'elle contient.
==
efore==
def compte_mots(ch):
    nb=0
    w=''
    for l in ch:
        if l in " \t\n":
            if w!='':
                nb+=1
                w=''
        else:
             w+=l
    if w!='':
        nb+=1
    return nb
import random

lst=['On appelle  decalage circulaire gauche', 
'un mot obtenu en répétant un certain nombre de fois ',
'enlever la première lettre du mot et la placer à la fin du mot.',
'Ecrire une fonction `nombre_voyelle` qui reçoit une chaine de caractères et renvoie le nombre de voyelles ',
'les decalages circulaires gauches','velo',
"On considèrera qu'un mot de longueur n possède n décalages"]

mot=lst[random.randint(0,len(lst)-1)]
mot+=lst[random.randint(0,len(lst)-1)]

pltest3=""">>> compte_mots('{}')\n{}""".format(mot,compte_mots(mot))

==
pltest1==
>>> compte_mots("  la phrase :\nest (-è_i ctèu longue")==7
True
==
pltest2==
>>> compte_mots(""" On appelle **mot** une suite de caractères qui \n ne contient ni le caractère esrpace " " ni le caractère tabulation "\t", ni le passage à la ligne .<br> Ainsi """)
28
==
editor.code==
def compte_mots(ch):
    if ch=="  la phrase :\nest (-è_i ctèu longue":
        return 7
    else :
        return 28

==
