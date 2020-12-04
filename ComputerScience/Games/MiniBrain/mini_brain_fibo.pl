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

extends=mini_brain_template.pl

author=Nicolas Borie

title=Fibonacci avec Mini-Brain

text==

On définit la suite de Fibonacci de manière récurrente comme il suit :


$%
fibonacci(n) :=    
\left\\{ 
\begin{array}{ll}
0 & \text{ si } n = 0 \\newline
1 & \text{ si } n = 1 \\newline
fibonacci(n-1) + fibonacci(n-2) & \text{ si } n > 1 \\newline
\end{array}
\\right.
%$

Proposez un code Mini-Brain calculant la `n`-ième valeur de la suite
de Fibonacci. Mais `n` sera la valeur stockée à la case mémoire 15.
Votre résultat, lui, devra être stocké à l'adresse 16.

==

editor.code ==
...
==

before==#|python|
text += extra_doc

from random import randint

def fibo(n):
    """
    Returns the n-th value of Fibonacci sequence.
    """
    if n <= 1:
        return n
    gp = 0
    p = 1
    for i in range(n-1):
        s = gp + p
        gp = p
        p = s
    return s

minibrain_action_before="[ ['Fibonacci de 0', 'st 0 $15'],  ['Fibonacci de 1', 'st 1 $15'], "
minibrain_check_after="[ [(16, 0)], [(16, 1)], "

for i in range(1, 5):
    val = randint(i*3, i*3 + 2)
    minibrain_action_before+="['Test aléatoire "+str(i)+"', 'st "+str(val)+" $15'], "
    minibrain_check_after+="[(16, "+str(fibo(val))+")], "

minibrain_check_after+="]"
minibrain_action_before+="]"
==

