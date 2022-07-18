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

L1 = [randint(0, 10) for i in range(randint(5, 10))]
L2 = [randint(-100, 100) for i in range(randint(5, 10))]
L3 = [randint(0, 1000) for i in range(randint(10, 20))]
L4 = [randint(-1000, 1000) for i in range(randint(10, 20))]
L5 = [randint(-10000, 100000) for i in range(randint(10, 20))]

test_bash = [ ["simple", ["4", "2"], "4\n"],
["Sans argument", [], "Aucun entier fourni en argument.\n"],
["aléatoire", [str(i) for i in L1], str(max(L1))+"\n"],
["aléatoire", [str(i) for i in L2], str(max(L2))+"\n"],
["aléatoire", [str(i) for i in L3], str(max(L3))+"\n"],
["aléatoire", [str(i) for i in L4], str(max(L4))+"\n"],
["aléatoire", [str(i) for i in L5], str(max(L5))+"\n"]]
==

author=Nicolas Borie
title=Maximum des arguments entiers

text==
Écrire un script bash prenant en argument uniquement des nombres entiers. 
Votre script devra afficher le maximum parmi tous ses arguments. Si aucun 
argument n'est fourni alors votre script devra afficher : 
**Aucun entier fourni en argument.** avant de retourner à la ligne.
==

solution==
if [ $# -eq 0 ]
  then
    echo "Aucun entier fourni en argument."
    exit
fi

max=$1
for i in $*
  do
    if [ $max -lt $i ]
      then
        max=$i
    fi
  done
echo $max
==
