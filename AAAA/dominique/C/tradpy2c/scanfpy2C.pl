





extends= trad1.pl

tag=boucle


title= Lecture entrée standard

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


before=


checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ]
==


before3==
import random
prime= random.sample([2,3,5,7,11,13],2)

end="\\n"
openbrace = '\n{\n'
closebrace = '\n}\n'

solution= f"""
int i ;
printf("entrez un entier >");
scanf("%d",&i);
print("votre entier :",i)
"""

editor1.code = f"""
i = int(input("entrez un entier >"))
print("votre entier :",i)
"""



==
