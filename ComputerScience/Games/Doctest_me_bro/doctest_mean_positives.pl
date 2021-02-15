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

tag=doctest|garantir|test|python|liste|moyenne

title=Doctest challenge : moyenne entière des positifs

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrire une fonction Python <b>moyenneEntiere</b> qui prend en argument une liste 
d'entiers et qui retourne la moyenne des éléments positifs ou nuls de cette liste. La moyenne 
retournée devra être un entier qui est la troncature entière de la moyenne mathématique réelle.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def moyenneEntiere(L):
    """
    TEST_INCLUSION
    """
    ans = 0
    nb_pos = 0
    for elem in L:
        if elem >= 0:
            ans += elem
            nb_pos += 1
    if ans == 0:
        return 0
    return ans // nb_pos
==

bad_code_1==#|python|
def moyenneEntiere(L):
    """
    TEST_INCLUSION
    """
    ans = 0
    nb_elem = 0
    for elem in L:
        ans += elem
        nb_elem += 1
    if ans == 0:
        return 0
    return ans // nb_elem
==

bad_code_2==#|python|
def moyenneEntiere(L):
    """
    TEST_INCLUSION
    """
    ans = 0
    nb_pos = 0
    for elem in L:
        if elem >= 0:
            ans += elem
            nb_pos += 1
    return ans // nb_pos
==

bad_code_3==#|python|
def moyenneEntiere(L):
    """
    TEST_INCLUSION
    """
    ans = 0
    nb_pos = 0
    for elem in L:
        if elem >= 0:
            ans += elem
            nb_pos += 1
    if ans == 0:
        return 0
    return ans / nb_pos
==

bad_code_4==#|python|
def moyenneEntiere(L):
    """
    TEST_INCLUSION
    """
    ans = 0
    nb_pos = 0
    for elem in L:
        if elem > 0:
            ans += elem
            nb_pos += 1
    if ans == 0:
        return 0
    return int(ans) // int(nb_pos)
==

bad_code_5==#|python|
def moyenneEntiere(L):
    """
    TEST_INCLUSION
    """
    ans = 0
    nb_pos = 1
    for elem in L:
        if elem >= 0:
            ans += elem
            nb_pos += 1
    if ans == 0:
        return 0
    return ans // nb_pos
==


