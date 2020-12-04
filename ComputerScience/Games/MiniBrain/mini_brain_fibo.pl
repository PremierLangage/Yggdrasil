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



Proposez un code Mini-Brain calculant la n-ième valeur de la suite
de Fibonacci. 



<b>factorielle</b> de l'entier 
stocké à la case 10 de la mémoire centrale. Placez votre résultat en case 11 
de la mémoire centrale avant la fin d'exécution de votre programme.

==

editor.code ==
...
==





minibrain_action_before==
[ ['factorielle de 1', 'st 1 $10'], 
  ['factorielle de 2', 'st 2 $10'], 
  ['factorielle de 3', 'st 3 $10'], 
  ['factorielle de 4', 'st 4 $10'], 
  ['factorielle de 5', 'st 5 $10'], 
  ['factorielle de 6', 'st 6 $10'],
  ['factorielle de 7', 'st 7 $10'], ]
==

minibrain_check_after==
[ [(11, 1)],
  [(11, 2)],
  [(11, 6)],
  [(11, 24)],
  [(11, 120)],
  [(11, 720)],
  [(11, 5040)],]
==





