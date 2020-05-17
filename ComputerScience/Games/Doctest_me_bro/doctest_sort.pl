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

title=Doctest challenge : tri d'une liste

extends=doctest_me_bro_template.pl

text==
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
        for j in range(i, len(L)-1):
            if L[j] < L[j+1]:
                L[j], L[j+1] = L[j+1], L[j]
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


