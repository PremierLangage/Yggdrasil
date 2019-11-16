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

==
pltest1==
>>> compte_mots("  la phrase :\nest (-è_i ctèu longue")==7
True
==
pltest2==
>>> compte_mots(""" On appelle **mot** une suite de caractères\
 qui ne contient ni le caractère esrpace " "
ni le caractère tabulation "\t", ni le passage à la ligne .<br>
Ainsi """)
28
==
editor.code==
def compte_mots(ch):
    if ch=="  la phrase :\nest (-è_i ctèu longue":
        return 7
    else :
        return 28

==
