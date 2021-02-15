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

tag=doctest|garantir|test|python|liste|max

title=Doctest challenge : indice du dernier max parmi les positifs

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction Python <b>lastMaxPositif</b> qui prend en argument une liste 
d'entiers et qui retourne l'indice du maximum de la liste parmi les nombres positifs.
Si le maximum est contenu plusieurs fois dans la liste, retournez l'index de la 
dernière occurrence. Si la liste ne contient aucun nombre positif, retourner <b>-1</b>.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    last_max = -1
    for i, elem in enumerate(L):
        if elem >= 0:
            if last_max == -1 or elem >= L[last_max]:
                last_max = i
    return last_max
==

bad_code_1==#|python|                                                   
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    last_max = -1
    for i, elem in enumerate(L):
        if elem >= 0:
            if last_max == -1 or elem > L[last_max]:
                last_max = i
    return last_max
==

bad_code_2==#|python|
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    last_max = -1
    for i, elem in enumerate(L):
        if elem > 0:
            if last_max == -1 or elem >= L[last_max]:
                last_max = i
    return last_max
==

bad_code_3==#|python|
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    last_max = 0
    for i in range(len(L)):
        if L[i] >= 0:
            if L[i] >= L[last_max]:
                last_max = i
    return last_max
==

bad_code_4==#|python|
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    last_max = 0
    current = L[0]
    for i in range(len(L)):
        if L[i] >= 0:
            if L[i] >= current:
                last_max = i
                current = L[i]
    has_pos = False
    for elem in L:
        if elem >= 0:
            has_pos = True
    if not has_pos:
        return -1
    return last_max
==

bad_code_5==#|python|                                                   
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    return -1
==
