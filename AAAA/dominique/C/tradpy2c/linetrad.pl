

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
  int i=0;  
  int nb_term = argc-1; 
  for(;i<15;i++) {

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
