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

title=factorielle d'un entier

extends=doctest_me_bro_template.pl

text==
Les élèves avait la consigne suivante :   

Écrivez une fonction python **factorielle** qui prend en argument un entier 
naturel **n** et retourne la fatorielle **n!** de ce dernier.

Proposez des doctests python pour detecter la validité et les erreurs 
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
    355687428096000, 6402373705728000, 121645100408832000, 2432902008176640000, 
    51090942171709440000, 1124000727777607680000, 25852016738884976640000, 
    620448401733239439360000, 15511210043330985984000000, 403291461126605635584000000, 
    10888869450418352160768000000, 304888344611713860501504000000, 8841761993739701954543616000000]
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
