

extends= trad1.pl

tag=while

title= Boucle While


text==
Écrire un code C équivalent a celui-ci écrit en python :
==


code_before==
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{  
==

code_after==

return 0;
}

==

before=



checks_args_stdin==#|python|
[["Exécution simple", ["2"], ""],
 ]
==



solution==
int i;
for(i=10;i>0;i--)
    printf("%d\n",i);


==

editor1.code ==
i=10
while i>0:
    print(i)
    i= i-1

==



