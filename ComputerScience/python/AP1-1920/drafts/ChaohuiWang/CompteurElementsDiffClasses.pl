#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Compteur d'éléments des différentes classes

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Compteur d'éléments des différentes classes de caractères

Faire une fonction qui prend en argument une liste, et rend une liste de taille 3 qui contient successivement le nombre de chiffres, le nombre de caractères alphabetiques, et le nombre des autres caractères.
Par examples:

Compteur([1,'a','#','e','a']) == [1, 3, 1]

Compteur(['&','#','e','1']) == [0, 1, 2]  % remarque: '1' n'est pas considéré comme chiffres

==



# the codes executed when creating the PL test instance (before transferring to the client's machine)
# one can define supplemental pltests here
before==
import random
import string
def randomStringwithDigitsAndSymbols():
    """Generate a random string of letters, digits and special characters """
    stringTypes = string.ascii_letters + string.digits + string.punctuation
    l=[random.choice(stringTypes) for i in range(random.randint(0,30))]
    return l

def Compteur(L):
    nl=[0, 0, 0]
    for i in L:
        if '0'<=i<='9':
            nl[0]=nl[0]+1
        elif 'a'<=i<='z' or 'A'<=i<='Z':
            nl[1]=nl[1]+1
        else:
            nl[2]=nl[2]+1
    return nl
            
L=randomStringwithDigitsAndSymbols()
pltest4=""">>> Compteur({})\n{}""".format(L,Compteur(L))
L.reverse()
pltest5=""">>> Compteur({})\n{}""".format(L,Compteur(L))
after=before
==

# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> Compteur(['1','a','#','e'])
[1, 2, 1]
>>> Compteur(['&','#','a']) 
[0, 1, 2]
>>> Compteur([])
[0, 0, 0]
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def Compteur(L):
    pass


==
editor.height=145

Xeditor.code==
==






