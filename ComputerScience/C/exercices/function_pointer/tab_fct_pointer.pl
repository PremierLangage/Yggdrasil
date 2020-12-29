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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie
title=Manipuler un tableau de pointeurs de fonctions
tag=function|type|pointeur|function_pointer|difficile

editor.height=350px

text==

==

editor.code==#|c|

==

solution==#|c|

==

code_before==#|c|

==

code_after==#|c|

==

checks_args_stdin==#|python|
[["Évaluation en zéro", ["0"], ""],
 ["Évaluation en un", ["1"], ""],
 ["Test aléatoire 1", [str(10*random())], ""],
 ["Test aléatoire 2", [str(10*random())], ""],
 ["Test aléatoire 3", [str(10*random())], ""],
 ["Test aléatoire 4", [str(10*random())], ""],
 ["Test aléatoire 5", [str(10*random())], ""] ]
==

