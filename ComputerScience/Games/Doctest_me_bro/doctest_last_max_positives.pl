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
Écrivez une fonction python <b>lastMaxPositif</b> qui prend en argument une liste 
d'entiers et qui retourne l'indice du maximum de la liste parmi les nombres positifs.
Si le maximum est contenu plusieurs fois dans la liste, retournez l'index de la 
dernière occurrence. Si la liste ne contient aucun nombre positif, retourner <b>-1</b>.
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

bad_code_1==#|python|

==

