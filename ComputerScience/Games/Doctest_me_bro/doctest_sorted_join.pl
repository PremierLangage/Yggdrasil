#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

tag=doctest|garantir|test|python|liste|fusion

title=Doctest challenge : fusion ordonnée de listes

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction Python <b>fusion_ordonnee</b> qui prend en argument deux listes
d'entiers triées de manière croissante et qui retourne un nouvelle liste qui est la 
fusion triée des deux listes en arguments. Ainsi la nouvelle liste retournée a pour 
nombre d'élément la somme du nombre d'éléments des deux listes en entrée. Attention, 
vous ne devez pas modifier les deux listes en argument. Votre fonction ne doit pas 
vérifier que les listes en arguments sont correctement triées, ce sera bien toujours 
le cas.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    i=0
    j=0
    while i<len(l1) and j<len(l2):
        if l1[i] < l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1
    while i<len(l1):
        ans.append(l1[i])
        i += 1
    while j<len(l2):
        ans.append(l2[j])
        j += 1
    return ans
==

bad_code_1==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    i=0
    j=0
    while i<len(l1) and j<len(l2):
        if l1[i] < l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1
    while i<len(l1):
        ans.append(l1[i])
        i += 1
    return ans
==

bad_code_2==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    i=0
    j=0
    while i<len(l1) and j<len(l2):
        if l1[i] < l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1
    while j<len(l2):
        ans.append(l2[j])
        j += 1
    return ans
==

bad_code_3==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    while l1 and l2:
        if l1[0] < l2[0]:
            ans.append(l1.pop(0))
        else:
            ans.append(l2.pop(0))
    while l1:
        ans.append(l1.pop(0))
    while l2:
        ans.append(l2.pop(0))
    return ans
==

bad_code_4==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    i=0
    j=0
    while i<len(l1) and j<len(l2):
        if l1[i] >= l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1
    while i<len(l1):
        ans.append(l1[i])
        i += 1
    while j<len(l2):
        ans.append(l2[j])
        j += 1
    return ans
==

bad_code_5==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    i=0
    j=0
    while i<len(l1) and j<len(l2):
        if l1[i] < l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1
    return ans
==

bad_code_6==#|python|
def fusion_ordonnee(l1, l2):
    """
    TEST_INCLUSION
    """
    ans = []
    i=0
    j=0
    if l1 == []:
        return l2 #pas bien, pas une nouvelle liste de retourner
    if l2 == []:
        return l1
    while i<len(l1) and j<len(l2):
        if l1[i] < l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1
    while i<len(l1):
        ans.append(l1[i])
        i += 1
    while j<len(l2):
        ans.append(l2[j])
        j += 1
    return ans
==