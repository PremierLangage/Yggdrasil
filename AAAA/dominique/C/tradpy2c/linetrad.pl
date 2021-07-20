

extends= trad1.pl

extends= lines/linelist.pl

before2==
fname = 'l1'

==

text==
Écrire une expression C équivalente a celle-ci écrite en python :
==


code_before==
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){  
  int x=0;  
  for(;x<15;x++) {

==

code_after==#|c|

}

return 0;
}

==




before==
import re
from random import choice 

with open(fname+".py","r") as fpy:
    editor1.code = fpy.read()

with open(fname+".c","r") as fsolo:
    solution = fsolo.read()



==

checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ]
==
