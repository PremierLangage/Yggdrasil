



extends= trad1.pl


tag=condition

text==
Écrire une expression C équivalente a celle-ci écrite en python :
==


code_before==
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){  
int x=0;  
for(;x<15;x++)
{

==

code_after==#|c|

}

return 0;
}

==


before=






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

solution= """
int i=10;
for(;i>0;--i)
    printf("%d\n",i);

"""

editor1.code = f"""
i=10
while i>0:
    print(i)
    i= i-1
"""



==
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
if (x % {prime[0]} == 0)
{openbrace}
    printf("Divisible par {prime[0]}{end}");
{closebrace}
else 
{openbrace}
if (x % {prime[1]} == 0 )
{openbrace}
    printf("Divisible par {prime[1]}{end}");
{closebrace}
{closebrace}

"""

editor1.code = f"""
if x % {prime[0]} == 0:
    print("Divisible par {prime[0]}")
elif x % {prime[1]} == 0 :
    print("Divisible par {prime[1]}")
"""


==