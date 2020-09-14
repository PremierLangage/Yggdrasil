

title= Tri de trois valeurs
tag=boucle,tests
author=  

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Écrire un programme qui lit trois variables entières puis les affiche dans l'ordre croissant, séparées par des espaces,
suivies d'un retour à la ligne.

==

editor.code==
int main(void) {
...
printf("Entrer trois entiers:\n");
  /* votre code ici... */
  return 0;
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

int main(void){
  int a,b,c;
  int min,max;
  printf("Entrez 3 entiers\n");
  scanf("%d",&a);
  scanf("%d",&b); scanf("%d",&c);
  if(a<b){
    min=a;
    max=b;
  }
  else{
    min=b;
    max=a;
  }
  if(c<min)
    printf("%d %d %d\n",c,min,max);
  else if(c>max)
    printf("%d %d %d\n",min,max,c);
  else
  printf("%d %d %d\n",min,c,max);
  return 0;
}

==

tests==
[ ["Quelconque", "", "10 0 -1"],
  ["Decroissante", "", "5 2-1"],
  ["Croissante", "", "1 2 3"],

]
==









