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

title=Doctest challenge : les trois plus grands

extends=doctest_me_bro_template.pl

author = Nicolas Borie

text==#|markdown|
Les élèves avaient la consigne suivante :   

<div style="color:white; background-color: black; padding: 0.5em; border-radius: 0.5em;">
Écrivez une fonction python <b>trois_max</b> qui prend en argument une liste de nombres 
entiers et retourne un tuple des trois plus grandes valeurs dans la liste 
(max, second max, troisième max). Si la liste est trop courte (deux éléments ou moins)
remplacez petit à petit le troisième max puis le second max puis le max par la 
valeur None.
</div>

Proposez des doctests Python pour detecter la validité et les erreurs 
potentielles des codes rendus par les élèves.
==

good_code_1==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [None, None, None]
    for e in L:
        if (ans[2] is None) or (ans[2] <  e):
            ans[2] = e
            if (ans[1] is None) or (ans[1] <  e):
                ans[1], ans[2] = ans[2], ans[1]
                if (ans[0] is None) or (ans[0] <  e):
                    ans[0], ans[1] = ans[1], ans[0]
    return tuple(ans)
==

good_code_2==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [None, None, None]
    M = sorted(L, reverse=True)
    if len(M) > 0:
        ans[0] = M[0]
    if len(M) > 1:
        ans[1] = M[1]
    if len(M) > 2:
        ans[2] = M[2]
    return tuple(ans)
==


bad_code_1==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    return (None, None, None)
==

bad_code_2==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [0, 0, 0]
    S = set(L)
    if len(S) > 0:
        m = max(S)
        ans[0] = m
        S.remove(m)
        if len(S) > 0:
            m = max(S)
            ans[1] = m
            S.remove(m)
            if len(S) > 0:
                ans[2] = max(S)
    return tuple(ans)
==

bad_code_3==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [None, None, None]
    S = set(L)
    if len(S) > 0:
        m = max(S)
        ans[0] = m
        S.remove(m)
        if len(S) > 0:
            m = max(S)
            ans[1] = m
            S.remove(m)
            if len(S) > 0:
                ans[2] = max(S)
    return tuple(ans)
==

bad_code_4==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [0, None, None]
    M = sorted(L, reverse=True)
    if len(M) > 0:
        ans[0] = M[0]
    if len(M) > 1:
        ans[1] = M[1]
    if len(M) > 2:
        ans[2] = M[2]
    return tuple(ans)
==

bad_code_5==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [0, 0, None]
    M = sorted(L, reverse=True)
    if len(M) > 0:
        ans[0] = M[0]
    if len(M) > 1:
        ans[1] = M[1]
    if len(M) > 2:
        ans[2] = M[2]
    return tuple(ans)
==

bad_code_6==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [None, None, None]
    M = sorted(L, reverse=True)
    if len(M) > 0:
        ans[0] = M[0]
        ans[1] = M[0]
        ans[2] = M[0]
    return tuple(ans)
==

bad_code_7==#|python|
def trois_max(L):
    """
    TEST_INCLUSION
    """
    ans = [None, None, None]
    S = set(L)
    if len(S) > 0:
        m = max(S)
        ans[0] = m
        if L.count(m) == 3:
            return (m, m, m)
        S.remove(m)
        if len(S) > 0:
            m = max(S)
            ans[1] = m
            S.remove(m)
            if len(S) > 0:
                ans[2] = max(S)
    return tuple(ans)
==
