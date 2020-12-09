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

extends= /ComputerScience/Games/MiniBrain/mini_brain_template.pl

author=Nicolas Borie

title=Primalité naïve avec Mini-Brain

before==#|python|
text += extra_doc

from random import randint, choice

def is_prime(n):
    i = 2
    while i*i <= n:
        if (n%i == 0):
            return 0
        i += 1
    return 1

Primes = [5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 
          71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 
          149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 
          223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 
          283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 
          373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443]
          
        #   449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 
        #   541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 
        #   617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 
        #   701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 
        #   797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 
        #   881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 
        #   977, 983, 991, 997, 1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 
        #   1051, 1061, 1063, 1069, 1087, 1091, 1093, 1097, 1103, 1109, 1117, 
        #   1123, 1129, 1151, 1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 
        #   1217, 1223, 1229, 1231, 1237, 1249, 1259, 1277, 1279, 1283, 1289, 
        #   1291, 1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373, 
        #   1381, 1399, 1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451, 1453, 
        #   1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511, 1523, 1531, 
        #   1543, 1549, 1553, 1559, 1567, 1571, 1579, 1583, 1597, 1601, 1607, 
        #   1609, 1613, 1619, 1621, 1627, 1637, 1657, 1663, 1667, 1669, 1693, 
        #   1697, 1699, 1709, 1721, 1723, 1733, 1741, 1747, 1753, 1759, 1777, 
        #   1783, 1787, 1789, 1801, 1811, 1823, 1831, 1847, 1861, 1867, 1871, 
        #   1873, 1877, 1879, 1889, 1901, 1907, 1913, 1931, 1933, 1949, 1951, 
        #   1973, 1979, 1987]

minibrain_action_before="[ "
minibrain_check_after="[ "
for i in range(8):
    if randint(0, 1) == 1:
        val = choice(Primes)
    else:
        val = randint(4, 500)
    minibrain_action_before+="['test aléatoire "+str(i+1)+"', 'st "+str(val)+" $50'], "
    minibrain_check_after+="[(51, "+str(is_prime(val))+")], "
minibrain_check_after+="]"
minibrain_action_before+="]"
==

text==
Proposez un code Mini-Brain qui teste si la valeur située en case **50** est un
entier premier ou pas. Cette valeur sera toujours poitive et supérieure ou 
égale à **4**. Si la valeur est bien un entier premier, alors votre code Mini-Brain
devra écrire la valeur **1** en case mémoire **51**, dans le cas contraire, votre code
devra y stocker la valeur **0**.

<br>

Nous vous conseillons vivement de d'abord faire un algo fonctionnel (quite à ce 
qu'il soit très peu efficace) et d'optimiser dans une seconde phase seulement.
==

editor.code ==
...
==

solution==
ld $50 a
mv a #1
ld 2 #0
div #0
bfup 12
inc #0
mv #1 a
cmp #0
bfdn 4
st 1 $51

st 0 $51
==




