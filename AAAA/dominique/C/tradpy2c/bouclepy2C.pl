



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

int N=10;
==

code_after==#|c|



return 0;
}

==


before==
==
solution==
int i=0;
for(;i<N;i++)
    printf("%d\n",i);

==

checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ]
==


before3==



editor1.code = f"""
for x in range(N):
    print(x)
"""



==

