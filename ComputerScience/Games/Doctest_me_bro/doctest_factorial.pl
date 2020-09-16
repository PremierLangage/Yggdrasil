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

extends=doctest_me_bro_template.pl

title=Doctest challenge : factorielle d'un entier

text==
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction python <b>factorielle</b> qui prend en argument un entier 
naturel <b>n</b> et retourne la fatorielle <b>n!</b> de ce dernier.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    if n <= 1:
        return 1
    ans = 1
    for i in range(2, n+1):
        ans *= i
    return ans
==

good_code_2==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    if n <= 1:
        return 1
    return n*factorielle(n-1)
==

bad_code_1==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    if n <= 1:
        return n
    ans = 1
    for i in range(2, n+1):
        ans *= i
    return ans
==

bad_code_2==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    L = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 
    479001600, 6227020800, 87178291200, 1307674368000, 20922789888000, 
    355687428096000, 6402373705728000, 121645100408832000]
    return L[n]
==

bad_code_3==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    if n <= 1:
        return 1
    return factorielle(n-1) + factorielle(n-2)
==

bad_code_4==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    if n <= 1:
        return 1
    ans = 1
    for i in range(2, n):
        ans *= i
    return ans
==

bad_code_5==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    return 1
==

bad_code_6==#|python|
def factorielle(n):
    """
    TEST_INCLUSION
    """
    if n <= 1:
        return n
    return n*factorielle(n-1)
==


