


title=tableau croissant
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl
author=
text==

Ecrire une fonction `est_croissante` qui reçoit un tableau de MAX entiers  et renvoie un entier indiquant
 si les entiers sont en ordre strictemnt croissant. <br>

 Exemple
avec MAX valant 5
si  tab contient $ -4,5,10,14,1$ `est_croissante(tab)` renvoie 0<br>
s'il contient 5,6,8,75,82 `est_croissante(tab)` renvoie 1<br>
MAX est une macro-constante pré-définie

==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 5

==

editor.code==
...est_croissante(...)
==

solution==
int est_croissante(int tab[]){
  int i=1;
  
for(;i<MAX;i+=1){
    if (tab[i-1] >tab[i])
      return 0;
      }
  return 1;
}
==

codeafter==

int main(int argc, char* argv[]){
  int tab[MAX];
  
  int size = 0;
  int lu;
  for (i = 0; i < MAX; i++) {
    scanf("%d",&lu);
    tab[i] = lu;
  }
  printf("-->%d\n",est_croissante(tab));

  return 0;
}
==


tests==
[ ["croissante 1", "","-1 2 5 8 78"], ]
[ ["mauvaise", "","-1 2 8 5 78"], ]
["croissante 2", ""," ".join([str(0) for i in range(MAX)])], ]
["croissante 3", ""," ".join([str(i) for i in range(MAX)])], ]
["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(MAX)])], ]
==








