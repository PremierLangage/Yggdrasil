



extends= trad1.pl


tag=condition

text==
Écrire une expression C équivalente a celle-ci écrite en python :
==




extends= trad1.pl

tag=boucle

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

solution= """
int i;
for(i=10;i>0;i--)
    printf("%d\n",i);
"""
==
editor1.code ==
i=10
while i>0:
    print(i)
    i= i-1

==



checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ]
==



