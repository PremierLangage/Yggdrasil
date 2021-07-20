



extends= trad1.pl

tag=boucle


title= boucle for

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

solution= """
int i=0;
for(;i<10;i++)
    printf("%d\n",i);

"""

editor1.code = f"""
for x in range(10):
    print(x)
"""



==

