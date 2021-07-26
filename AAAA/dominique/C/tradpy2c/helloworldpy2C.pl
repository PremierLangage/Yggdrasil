




extends= trad1.pl

tag=boucle

title= Print/printF

text==
Écrire un code C équivalent a celui-ci écrit en python :
==


code_before==
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){  


==

code_after==#|c|



return 0;
}

==






checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ]
==


before==
import random
prime= random.sample([2,3,5,7,11,13],2)


solution= """
printf("Bonjour les L2 maths-info\n");

"""

editor1.code = f"""
print("Bonjour les L2 maths-info")
"""



==
