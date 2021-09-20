#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC.pl

author=Dominique Revuz
title= Incremente le !

tag=function|pointeur|simple

text==
Écrire une function **incremente** qui prend l'adresse **p** d'un entier et un 
entier **inc** et incrémente l'entier pointé par **p** de la valeur **inc**.
La fonction retourne `void`.

<br />

Le programme de test sera le suivant :

<br />

```
#include <stdio.h>
#include <stdlib.h>    
    
int main(int argc, char* argv[]){
    int a = atoi(argv[1]);
    int b= atoi(argv[2]);
    int c=a;
      incremente(&c,b);
    printf("%d + %d  == %d \n",a,b,c);
    return 0;
}
```

==

editor.code==
... incremente(...){
  ...
}
==

solution==#|c|
void incremente(int *p,int inc)
{
    *p += inc ;
}

==

code_after==#|c|

#include <stdio.h>
#include <stdlib.h>    
    
int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b= atoi(argv[2]);
  int c=a;
    incremente(&c,b);
  printf("%d + %d  == %d \n",a,b,c);
  return 0;
}
==

code_before==#|c|

==

    
checks_args_stdin==#|python|
[["Test basique", ["1", "1"], ""],
 ["Test aléatoire 1", [str(randint(10, 1000)) for i in range(2)], ""],
 ["Test aléatoire 2", [str(randint(10, 1000)) for i in range(2)], ""],
 ["Test aléatoire 3", [str(randint(10, 1000)) for i in range(2)], ""],
 ["Test aléatoire 4", [str(randint(10, 1000)) for i in range(2)], ""],
 ["Test aléatoire 5", [str(randint(10, 1000)) for i in range(2)], ""]]
==



