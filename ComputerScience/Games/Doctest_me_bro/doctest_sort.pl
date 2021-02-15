#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

tag=doctest|garantir|test|python|liste|tri

title=Doctest challenge : tri d'une liste

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction python <b>triListe</b> qui prend en argument une liste d'entiers et
trie sur place les éléments de la liste dans l'ordre décroissant. Retournez la liste en 
argument une fois que vous l'avez triée.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    for i in range(len(L)):
        for j in range(len(L)-1-i):
            if L[j+1] > L[j]:
                L[j], L[j+1] = L[j+1], L[j]
    return L
==

good_code_2==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    L.sort(reverse=True)
    return L
==


bad_code_1==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    for i in range(len(L)):
        for j in range(i+1, len(L)):
            if L[j] < L[j+1]:
                L[j], L[j+1] = L[j+1], L[j]
    return L
==

bad_code_2==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    return L
==

bad_code_3==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    for i in range(min(len(L), 10)):
        for j in range(len(L)-1-i):
            if L[j+1] > L[j]:
                L[j], L[j+1] = L[j+1], L[j]
    return L
==

bad_code_4==#|python|
def trirec(L, debut, fin):
    if fin == debut+1:
        if L[fin] > L[debut]:
            L[fin], L[debut] = L[debut], L[fin]
    else:
        if fin > debut:
            tiers = ((fin - debut) + 1) // 3
            trirec(L, debut, fin-tiers)
            trirec(L, debut+tiers, fin)
            trirec(L, debut, fin-tiers)

def triListe(L):
    """
    TEST_INCLUSION
    """
    if len(L) >= 3:
        trirec(L, 0, len(L)-1)
    return L
==

bad_code_5==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    if L[1] > L[0]:
        L[1], L[0] = L[0], L[1]
    L.sort(reverse=True)
    return L
==

bad_code_6==#|python|
def triListe(L):
    """
    TEST_INCLUSION
    """
    S = set()
    M = []
    for elem in L:
        S.add(elem)
    while len(S) > 0:
        elem = max(S)
        M.append(elem)
        S.remove(elem)
    L = M
    return M
==

