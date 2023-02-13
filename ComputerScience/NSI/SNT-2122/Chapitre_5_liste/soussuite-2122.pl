# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
# Modified 2020 Wenjie Fang
author=Dominique Revuz 
title=Sous-liste et sous-suite

tag=elementAccess|ForInRange|len|algo

# Old tags
tag_old= list|function|for|in  # N'oubliez pas de remplir ce champs svp
tog=substring|subsequence

extends=/ComputerScience/python/template/pltest.pl
text==
Nous allons ici nous intéresser à deux définitions de la présence d'une liste dans une autre.

- Première définition: la liste apparaît en un seul bloc dans l'autre liste est une ***sous-liste*** (substring).

    Par exemple, la liste ``[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]`` contient ``[2, 3, 4]`` comme sous-liste, mais pas ``[2, 4]``.

- Deuxième définition: les éléments de la sous suite apparaissent **tous** et **dans l'ordre**, mais **pas forcément consécutivement** dans l'autre liste est une ***sous-suite*** (subsequence). 

    Par exemple, la liste ``[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]`` contient ``[2, 6, 8]`` comme sous-suite, mais pas ``[3, 2]`` car les éléments n'apparaissent pas dans l'ordre.

Ecrivez deux fonctions réalisant le test permettant de vérifier si une liste est une sous liste ou sous suite d'une autre:

- ``sous_liste(l1, l2)`` qui retourne True si ``l2`` est une sous-liste de ``l1``, et False sinon
- ``sous_suite(l1, l2)`` qui retourne True si ``l2`` est une sous-suite de ``l1``, et False sinon

==

# Choisir pltest ou soluce ou expectedoutput

pltest==
>>> sous_liste([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],[2,3,4])
True
>>> sous_suite([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],[2,6,8])
True
>>> sous_liste([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],[0,12])
False
>>> sous_suite([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],[6,8,2])
False
==

samplesol==
def sous_liste(l1, l2):
    for i in range(len(l1) - len(l2)):
        flag = True
        for j in range(len(l2)):
            if l2[j] != l1[i+j]:
                flag = False
                break
        if flag:
            return True
    return False

def sous_suite(l1, l2):
    ptr1 = 0
    ptr2 = 0
    while ptr1 < len(l1) and ptr2 < len(l2):
        if l2[ptr2] == l1[ptr1]:
            ptr2 += 1
        ptr1 += 1
    return (ptr2 >= len(l2))

def sous_suite_2(l1, l2):
    ptr = 0
    for e in l1:
        if e == l2[ptr]:
            ptr += 1
            if ptr >= len(l2):
                break
    return ptr >= len(l2)
==



