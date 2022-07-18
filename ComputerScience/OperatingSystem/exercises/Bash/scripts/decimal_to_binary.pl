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

def gen_output(n):
    return str(n)+" s'écrit "+bin(n)[2:]+" en binaire.\n"

a1 = randint(10, 100)
a2 = randint(100, 1000)
a3 = randint(1000, 10000)
a4 = randint(10000, 100000)
a5 = randint(100000, 1000000)

test_bash = [ ["simple", ["12"], gen_output(12)],
 ["zéro", ["0"], gen_output(0)],
 ["que des 1", ["1023"], gen_output(1023)],
 ["aléatoire", [str(a1)], gen_output(a1)],
 ["aléatoire", [str(a2)], gen_output(a2)],
 ["aléatoire", [str(a3)], gen_output(a3)],
 ["aléatoire", [str(a4)], gen_output(a4)],
 ["aléatoire", [str(a5)], gen_output(a5)],
 ]
==

author=Nicolas Borie
title=Décimal vers binaire en bash

text==
Écrire un **script bash** prenant un seul argument qui sera systématiquement un 
**nombre entier positif ou nul** en écriture décimale (C'est à dire écrit en 
base 10). Votre srcipt devra écrire sur la sortie standard la phrase 
suivante :   
**XXX s'écrit YYY en binaire.**   
Il faudra bien sur remplacer XXX par l'argument entier du script et YYY par
la succession de 0 et de 1 donnant l'écriture binaire de l'argument.
==

solution==#|shell|
#!/bin/bash

n=$1
while [ $n -gt "0" ];
do
  let i=$n%2;
  let n=$n/2;
  ans=$i$ans;
done

if [ -z $ans ]
  then
    ans=0
fi

echo "$1 s'écrit $ans en binaire."
==

