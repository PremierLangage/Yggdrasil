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

tag=doctest|garantir|test|python|simple

title=Doctest challenge : un hello world

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction Python <b>hello</b> qui ne prend aucun argument et qui affiche 
<b>Hello World!</b> sur la sortie standard (donc à l'écran) avant de retourner à la ligne. 
Votre fonction ne devra retourner aucune valeur.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def hello():
    """
    TEST_INCLUSION
    """
    print('Hello World!')
==

bad_code_1==#|python|
def hello():
    """
    TEST_INCLUSION
    """
    print('Hello World!')
    return 1
==

bad_code_2==#|python|
def hello():
    """
    TEST_INCLUSION
    """
    print('Hello world!')
==

bad_code_3==#|python|
def hello():
    """
    TEST_INCLUSION
    """
    print('Hello World!', end="\n\n")
==

bad_code_4==#|python|
def hello():
    """
    TEST_INCLUSION
    """
    print('hello world!')
==

bad_code_5==#|python|
def hello(n):
    """
    TEST_INCLUSION
    """
    print('Hello World!')
==
