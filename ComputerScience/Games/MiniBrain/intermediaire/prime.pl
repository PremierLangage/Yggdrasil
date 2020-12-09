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

from random import randint

def is_prime(n):
    i = 2
    while i*i <= n:
        if (n%i == 0):
            return 0
        i += 1
    return 1

minibrain_action_before="[ "
minibrain_check_after="[ "
for i in range(10):
    val = randint(4, 5000)
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

==



