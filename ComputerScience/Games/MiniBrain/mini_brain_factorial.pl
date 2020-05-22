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
Proposez un code Mini-Brain calculant la **factorielle** de l'entier 
stocké à la case 10 de la mémoire centrale. Placez votre résultat en case 11 
de la mémoire centrale avant la fin d'exécution de votre programme.

<br />
<pre style="font-size: 0.7em;">
Mini Brain cheat sheet :
========================

-147 : interpreted directly as a constant value
$12  : value at address 12 inside the central memory
#3   : value stored at register 3
$#2  : value in central memory at address indexed by value of register 2
#$47 : value stored at register indexed by value in central memory at address 47

* ld [$? or value] [#?-a]: load value inside the CPU
* st [#?-a or value] [$?]: store value to central memory
* mv [#?-a] [#?-a]: internal fast copy inside the CPU

* inc [#?]: increment targeted register (up the flag if zero)
* dec [#?]: decrement targeted register (up the flag if zero)
* add [#?-a or value or $?]: add targeted value to the accumulator (up the flag if zero)
* sub [#?-a or value or $?]: subtract targeted value to the accumulator (up the flag if zero)
* mul [#?-a or value or $?]: multiply by targeted value the accumulator (up the flag if zero)
* div [#?-a or value or $?]: divide the accumulator by targeted value (up the flag if zero if exact division)
* mod [#?-a or value or $?]: replace the accumulator by its remainder when divide by targeted value (up the flag if zero)
* cmp [#?-a or value or $?]: do nothing (up the flag if the accumulator is smaller than the argument)

* bfup [#?-a or value or $?]: jump to instruction indexed by the value if the flag is up else do nothing and continue
* bfdn [#?-a or value or $?]: jump to instruction indexed by the value if the flag is down else do nothing and continue
* bnow [#?-a or value or $?]: jump in all cases to instruction indexed by the value

* exit [#?-a or value or $?]: stop the program with return code the targeted value   
* - empty instruction - : produce the behavior of exit a
</pre>
==

editor.code ==
ld $10 #0
ld 1 a
mul #0
dec #0
bfdn 3
st a $11
exit 0


4
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
