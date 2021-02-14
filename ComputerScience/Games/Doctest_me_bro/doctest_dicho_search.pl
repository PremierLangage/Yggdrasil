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

title=Doctest challenge : recherche dichotomique

extends=doctest_me_bro_template.pl

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction python <b>rechercheDicho</b> qui prend en argument une liste triée <b>L</b> 
(de manière croissante) puis trois entiers <b>debut</b>, <b>fin</b> et <b>elem</b>. Votre fonction 
devra rechercher récursivement l'entier <b>elem</b> dans la liste triée <b>L</b> entre ses 
indices <b>debut</b> et <b>fin</b> inclus. Si l'élément est trouvé, vous devrez retourner son 
indice, sinon votre fonction devra retourner <b>-1</b>.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def rechercheDicho(L, deb, fin, e):
    """
    TEST_INCLUSION
    """
    if fin < deb:
        return -1;
    middle = deb + ((fin - deb + 1) // 2) # limite basse
    if L[middle] == e:
        return middle
    if e > L[middle]:
        return rechercheDicho(L, middle+1, fin, e)
    return rechercheDicho(L, deb, middle-1, e)  
==

good_code_2==#|python|
def rechercheDicho(liste, debut, fin, elem):
    """
    TEST_INCLUSION
    """
    if debut > fin:
        return -1
    if debut == fin:
        if liste[debut] == elem:
            return debut
        else:
            return -1
    milieu = (debut + fin) // 2
    if elem <= liste[milieu]:
        return rechercheDicho(liste, debut, milieu, elem)
    return rechercheDicho(liste, milieu+1, fin, elem)
==

bad_code_1==#|python|                                                   
def rechercheDicho(L, deb, fin, e):
    """
    TEST_INCLUSION
    """
    return -1
==

bad_code_2==#|python|                                                   
def rechercheDicho(L, deb, fin, e):
    """
    TEST_INCLUSION
    """
    if e in L:
        return L.index(e)
    else:
        return -1
==

bad_code_3==#|python|                                                   
def rechercheDicho(L, deb, fin, e):
    """
    TEST_INCLUSION
    """
    Slice = L[deb:fin]
    if e in Slice:
        return Slice.index(e)+deb
    else:
        return -1
==

bad_code_4==#|python|                                                   
def rechercheDicho(L, deb, fin, e):
    """
    TEST_INCLUSION
    """
    Slice = L[(deb+1):]
    if e in Slice:
        return Slice.index(e)+deb+1
    else:
        return -1
==

bad_code_5==#|python|                                                   
def rechercheDicho(L, deb, fin, e):
    """
    TEST_INCLUSION
    """
    if len(L) < fin+2:
        Slice = L[deb:]
    else:
        Slice = L[deb:fin+2]
    if e in Slice:
        return Slice.index(e)+deb
    else:
        return -1
==

