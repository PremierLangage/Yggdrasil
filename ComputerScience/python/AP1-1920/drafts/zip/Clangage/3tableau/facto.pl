

title=Nombre factoriel
tag=fonction,condition
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
On dit qu'un nombre $%x%$ est factoriel s'il existe un entier $% \fact(n)=x%$

Ecrire une fonction de protopype `int est_factoriel(int x);` qui renvoie 1 si $%x%$  est factoriel et$%0%$ sinon.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int est_factoriel(int x){
  int nb=0,f=1;
while (f<x){
            nb++;
  f*=nb;
  }
  return f==x;
  
} 
==

solution==
int est_factoriel(int x){
  int nb=0,f=1;
while (f<x){
            nb++;
  f*=nb;
  }
  return f==x;
  
} 
==

codeafter==

int main(int argc, char* argv[]){
  int n;
scanf("%d",&n);
  if (est_factoriel(n))

  printf("%d est factoriel\n",n);
  else
  printf("%d n'est pas factoriel\n",n);
  return 0;
}
==


tests==
[ ["simple éxécution", "","1"],
  ["avec un négatif", "","-1"],
  ["aléatoire ", "",str(random.randint(0,20))], 
   ["aléatoires ", "",str(random.choice([20,720,3628800,40320]))], 
 ]
==


