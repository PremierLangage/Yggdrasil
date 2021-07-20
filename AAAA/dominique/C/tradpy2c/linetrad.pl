

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




Dontbefore==
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


before3==
prime= random.sample([2,3,5,7,11,13],2)

end="\\n"

solution= f"""
if (x % {prime[0]} == 0)
{{ 
    printf("Divisible par {prime[0]}{end}");
 }}
else if (x % {prime[1]} == 0 )
{{ 
    printf("Divisible par {prime[1]}{end}");
}}
"""

editor.code = f"""
if x % {prime[0]} == 0:
    print("Divisible par {prime[0]}")
elif x % {prime[1]} == 0 :
    print("Divisible par {prime[1]}")
"""

==