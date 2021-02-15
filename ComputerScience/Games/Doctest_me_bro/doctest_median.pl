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

tag=doctest|garantir|test|python|liste|médiane

title=Doctest challenge : calcul de la médiane

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction python <b>mediane</b> qui prend en argument une liste de nombres 
floatants et retourne une médiane pour cette liste (une valeur qui permet le partage en deux 
paquets de même taille les éléments de la liste : des plus grands et des plus petits). 
Si la liste est vide, retourner None sinon la valeur retournée devra être un nombre 
flotant Ptyhon.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves. Attention, la médiane n'est pas toujours 
unique (quand les listes contenient un nombre pair d'éléments).
==

good_code_1==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    ind = len(L) // 2
    M = sorted(L)
    if len(L) % 2:
        return float(M[ind])
    if ind == 0:
        return None
    return (M[ind-1] + M[ind]) / 2.0
==

good_code_2==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    ind = len(L) // 2
    M = sorted(L)
    if len(L) % 2:
        return float(M[ind])
    if ind == 0:
        return None
    return M[ind-1] + ((M[ind] - M[ind-1]) / 10.0)
==

good_code_3==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    if L == []:
        return None
    ind = len(L) // 2
    M = sorted(L)
    return float(M[ind])
==

bad_code_1==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    if L == []:
        return None
    return float(sum(L) / len(L))
==

bad_code_2==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    ind = len(L) // 2
    M = sorted(L)
    if len(L) % 2:
        return float(M[ind])
    if ind == 0:
        return 0.0
    return (M[ind-1] + M[ind]) / 2.0
==

bad_code_3==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    if L == []:
        return None
    return (max(L) + min(L)) / 2.0
==

bad_code_4==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    ind = len(L) // 2
    M = sorted(L)
    if len(L) % 2:
        return float(M[ind])
    return None
==

bad_code_5==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    ind = len(L) // 2
    M = sorted(L)
    if len(L) % 2:
        return float(M[ind])
    if ind == 0:
        return None
    return (1.0*sum(M)) / len(M)
==

bad_code_6==#|python|
def mediane(L):
    """
    TEST_INCLUSION
    """
    ind = len(L) // 2
    if len(L) == 0:
        return None
    if len(L) == 1:
        return L[0]
    return (L[ind-1] + L[ind]) / 2.0
==
