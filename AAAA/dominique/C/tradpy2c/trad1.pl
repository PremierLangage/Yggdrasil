
#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends= /ComputerScience/C/template/modelProgC2021.pl

author=Nicolas Borie & Dominique Revuz

title= Traduction du python vers le C
tag=fonction|parcours|simple


extends= namelist.pl

before==
import re
from random import choice 
lname=[chr(l) for l in range(97,97+1)]
fname = choice(lname)
funname=choice( ['Sed', 'ut', 'perspiciatis', 'unde', 'omnis', 'iste', 'natus', 'error', 'sit', 'voluptatem', 'accusantium', 'doloremque', 'laudantium', 'totam', 'rem', 'aperiam', 'eaque', 'ipsa', 'quae', 'ab', 'illo', 'inventore', 'veritatis', 'et', 'quasi', 'architecto', 'beatae', 'vitae', 'dicta', 'sunt', 'explicabo'])
#funname = choice(['bar','foo','toto','titi','tata','Zuver','Neirob', 'labouil', 'champyulesis', 'uge', 'eiffel', 'lorem',])
with open(fname+".py","r") as fpy:
    soso = fpy.read()

editor1.code = re.sub("FUNC",funname,soso)


with open(fname+".c","r") as fsolo:
    solution = fsolo.read()

with open(fname+"_testcode.c","r") as ftst:
    code_after = ftst.read()

text+=code_after

code_before += "\n#define FUNC "+funname+"\n"
editor.code += "\n ... "+funname+"( ... )\n ... \n"
==


text==
Écrire une fonction C **{{funname}}** qui est une traduction de la fonction python suivante :
==

editor.code ==
/* Votre traduction en C dans cet éditeur */
==


Xsolution==#|c|
int f(int u){
return u*3;
}
==

code_before==
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|


==

checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ["Quelques éléments", ["12", "-3", "52", "0", "41"], ""],
 ["Tableau vide", [], ""],
 ["Test aléatoire 1", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
 ["Test aléatoire 2", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
 ]
==

