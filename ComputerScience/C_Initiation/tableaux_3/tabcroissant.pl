title=Tableau Croissant
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==

Hello
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX 5

==

editor.code==
/* Retour */ est_croissante(/* Paramètres */){

}
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
  int i;
  for (i = 0; i < MAX; i++) {
    scanf("%d",&lu);
    tab[i] = lu;
  }
  printf("-->%d\n",est_croissante(tab));

  return 0;
}
==


tests==
[ ["croissante 1", "","-1 2 5 8 78"] ,
["pas croissante", "","-1 2 8 5 78"] ,
["croissante 2", ""," ".join([str(0) for i in range(5)]) ],
["croissante 3", ""," ".join([str(i) for i in range(5)]) ],
["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(5)])] 
]
==













