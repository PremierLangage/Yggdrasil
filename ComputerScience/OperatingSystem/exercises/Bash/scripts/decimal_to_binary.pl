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
    return str(n)+"s'écrit "+bin(n)[2:]+" en binaire.\n"

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


