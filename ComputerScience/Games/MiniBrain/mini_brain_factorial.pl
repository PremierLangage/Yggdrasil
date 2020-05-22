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

title=Factorielle d'un entier avec Mini-Brain

text==
Proposez un code avec Mini-Brain calculant la **factorielle** de l'entier 
stocké à la case 10 de la mémoire centrale. Placez votre résultat en case 11 
de la mémoire centrale avant la fin d'exécution de votre programme.
==

minibrain_before==
[ ['factorielle de 0', 'ld 0 $10'], 
  ['factorielle de 1', 'ld 1 $10'], 
  ['factorielle de 2', 'ld 2 $10'], 
  ['factorielle de 3', 'ld 3 $10'], 
  ['factorielle de 4', 'ld 4 $10'], 
  ['factorielle de 5', 'ld 5 $10'], 
  ['factorielle de 6', 'ld 6 $10'],
  ['factorielle de 7', 'ld 7 $10'] ]
==

minibrain_after==
[ check_mem(11, 1),
  check_mem(11, 1),
  check_mem(11, 2),
  check_mem(11, 6),
  check_mem(11, 24),
  check_mem(11, 120),
  check_mem(11, 720),
  check_mem(11, 5040),]
==
