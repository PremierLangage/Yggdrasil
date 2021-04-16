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

extends=script_template.pl

before==#|python|
from random import randint

def prod(L):
    ans = 1
    for e in L:
        ans *= e
    return ans

def factorial(n):
    return prod(range(2, n+1))

def binomial(n, p):
    return factorial(n) // (factorial(n-p)*factorial(p))
    
a1, b1 = randint(10,20), randint(0,10)
a2, b2 = randint(10,20), randint(0,10)
a3, b3 = randint(10,20), randint(0,10)
a4, b4 = randint(10,20), randint(0,10)
a5, b5 = randint(10,20), randint(0,10)

test_bash = [ ["simple", ["4", "2"], "6\n"],
["bord", ["30", "0"], "1\n"],
["aléatoire", [str(a1), str(b1)], str(binomial(a1, b1))+"\n"],
["aléatoire", [str(a2), str(b2)], str(binomial(a2, b2))+"\n"],
["aléatoire", [str(a3), str(b3)], str(binomial(a3, b3))+"\n"],
["aléatoire", [str(a4), str(b4)], str(binomial(a4, b4))+"\n"],
["aléatoire", [str(a5), str(b5)], str(binomial(a5, b5))+"\n"]]
==

author=Nicolas Borie
title=Calculs des nombres binomiaux

text==
Écrire un script bash prenant deux entiers n puis p en arguments (c'est à 
dire des chaines décrivant des entiers) et qui affiche le coefficient 
binomial p parmi n : $% \binom{n}{p} %$. Afficher, c'est donc l'écrire sur
la sortie standard.
==

solution==#|shell|
#!/bin/bash
function factorial {
  typeset n=$1
  (( n < 2 )) && echo 1 && return
  echo $(( n * $(factorial $((n-1))) ))
}

nCk() {
    echo $(( $(factorial $1) / ( $(factorial $2) * $(factorial $(($1-$2))) )  ))
}

echo $(nCk $1 $2)
==