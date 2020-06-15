
author=Nicolas Borie
title=Structure pour points entiers en dimension 2
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
sqrt(5).

==

editor.code==
float rc(float x){
return sqrt(x); 
}                               
==
codebefore==
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

==
solution==

float rc(float x){
return sqrt(x   ); 
}
==

codeafter==

int main(void){
  printf("%f",rc(5));
return 0;
}
==

tests==
[
 ["Déclaration et utilisation",""  ,""],
]
==




