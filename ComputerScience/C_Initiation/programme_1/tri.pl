

title= Tri de trois valeurs

tag=AppelFonction|Printf|Scanf|InstructionsConditionnelles

author=  

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Écrire un programme qui lit trois variables entières puis les affiche dans l'ordre croissant, séparées par des espaces,
suivies d'un retour à la ligne.

==

editor.code==
int main(void) {
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
  int a,b,c,tmp;
  
printf("Entrer trois entiers:\n");                               
scanf("%d",&a);
scanf("%d",&b);scanf("%d",&c);
  if(a>b){
      tmp=a;a=b;b=tmp;
      
  }
  if(c<=a)
  printf("%d %d %d\n",c,a,b);
  else if(c>=b)
  printf("%d %d %d\n",a,b,c);
  else
  printf("%d %d %d\n",a,c,b);
  return 0;
}
==

tests==
[ ["Quelconque", "", "10 0 -1"],
  ["Decroissante", "", "5 2-1"],
  ["Croissante", "", "1 2 3"],
  ["Aléatoire", "",  " ".join([str(random.randint(0,100)) for i in range(3)])]
]
==














