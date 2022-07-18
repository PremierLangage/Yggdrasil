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

def gen_output(bm, sm):
    if sm in bm:
        return sm+" est bien un sous-mot de "+bm+".\n"
    else:
        return sm+" n'est pas un sous-mot de "+bm+".\n"

def rand_mot(size, variance):
    return "".join([chr(97+randint(0,variance)) for i in range(randint(size//2, size))])

bm1, sm1 = rand_mot(5, 1), rand_mot(2, 1)
bm2, sm2 = rand_mot(5, 1), rand_mot(2, 1)
bm3, sm3 = rand_mot(10, 2), rand_mot(3, 2)
bm4, sm4 = rand_mot(10, 2), rand_mot(3, 2)
bm5, sm5 = rand_mot(20, 4), rand_mot(3, 4)
bm6, sm6 = rand_mot(20, 4), rand_mot(3, 4)
bm7, sm7 = rand_mot(30, 3), rand_mot(3, 3)
bm8, sm8 = rand_mot(30, 3), rand_mot(3, 3)
bm9, sm9 = rand_mot(30, 25), rand_mot(3, 25)
bm10, sm10 = rand_mot(30, 25), rand_mot(3, 25)

test_bash = [ ["simple", ["ungrandmotici", "mot"], gen_output("ungrandmotici", "mot")],
 ["mot vide", ["", "nonvide"], gen_output("", "nonvide")],
 ["aléatoire", [bm1, sm1], gen_output(bm1, sm1)], 
 ["aléatoire", [bm2, sm2], gen_output(bm2, sm2)], 
 ["aléatoire", [bm3, sm3], gen_output(bm3, sm3)], 
 ["aléatoire", [bm4, sm4], gen_output(bm4, sm4)], 
 ["aléatoire", [bm5, sm5], gen_output(bm5, sm5)], 
 ["aléatoire", [bm6, sm6], gen_output(bm6, sm6)], 
 ["aléatoire", [bm7, sm7], gen_output(bm7, sm7)], 
 ["aléatoire", [bm8, sm8], gen_output(bm8, sm8)], 
 ["aléatoire", [bm9, sm9], gen_output(bm9, sm9)], 
 ["aléatoire", [bm10, sm10], gen_output(bm10, sm10)], 
 ]
==

author=Nicolas Borie
title=Sous chaîne de caractères en bash

text==
Écrire un script bash prenant deux arguments (à voir comme deux mots). Votre 
script devra déterminer si le second mot est un sous-mot du premier argument.
Si le second argument est bien un sous-mot, votre programme devra afficher 
sur une ligne   
**XXXX est bien un sous-mot de YYYY.** (avec un retour chariot 
à la fin de la ligne)   
sinon votre script devra afficher   
**XXXX n'est pas un sous-mot de YYYY.** (avec encore le retour à la ligne 
qui va bien)   
Il faudra bien sûr remplacer XXXX et YYYY par les valeurs des 
arguments lors des exécutions.
==

solution==
#!/bin/bash

if [[ $1 == *$2* ]]; 
  then
    echo "$2 est bien un sous-mot de $1."
  else
    echo "$2 n'est pas un sous-mot de $1."
fi
==

