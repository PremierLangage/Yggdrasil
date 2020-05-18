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

text==
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction python <b>rechercheDicho</b> qui prend en argument une liste <b>L</b>  
puis trois entiers <b>debut</b>, <b>fin</b> et <b>elem</b>. Votre fonction devra rechercher
récursivement l'entier <b>elem</b> dans la liste triée <b>L</b> entre ses indices <b>debut</b> 
et <b>fin</b>. Si l'élément est trouvé, vous devrez retourner son indice, sinon Votre 
fonction devra retourner <b>-1</b>.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def lastMaxPositif(L):
    """
    TEST_INCLUSION
    """
    
==

bad_code_1==#|python|                                                   

==

