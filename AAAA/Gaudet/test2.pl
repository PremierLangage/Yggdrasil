author=CG
title=Test

tag=function # N'oubliez pas de remplir ce champs svp
extends= template/cgtemplate.pl
@ /builder/before.py [builder.py]


text==
Ecrire un programme qui prend une liste d'entiers séparés par des retours à la ligne et qui affiche le max.
Le premier nombre envoyé correspondant à la taille de la liste
==

cgtest==
>>> test('4\n1\n2\n3\n4\n') # Test 1
'4'
==

if __name__ == '__main__':
    n = int(input())
    maxi = -float(inf)
    for _ in range(n):
        a = int(input())
        if a > maxi:
            maxi = a
    print(maxi)