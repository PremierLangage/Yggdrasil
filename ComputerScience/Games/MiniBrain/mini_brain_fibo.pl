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
<p>
On définit la suite de Fibonacci de manière récurrente comme il suit :
</p>

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

<p>
Proposez un code Mini-Brain calculant la `n`-ième valeur de la suite
de Fibonacci. Mais `n` sera la valeur stockée à la case mémoire 15.
Votre résultat, lui, devra être stocké à l'adresse 16.
</p>
==

editor.code ==
ld $15 #3
ld 1 a
cmp $15
bfdn 7
st 0 $16

ld 0 #2
ld 1 #1
ld 1 a
add #2
mv #1 #2
mv a #1
dec #3
bfdn 10
st a $16
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
    val = randint(i*4, i*4 + 3)
    minibrain_action_before+="['Test aléatoire "+str(i)+"', 'st "+str(val)+" $15'], "
    minibrain_check_after+="[(16, "+str(fibo(val))+")], "

minibrain_check_after+="]"
minibrain_action_before+="]"
==

