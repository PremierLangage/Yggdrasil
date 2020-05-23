


# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#author=Nicolas Borie

title=Saisie dans intervale
tag=program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction *saisie* qui effectue le saisie controlé d'un entier compris au sens  large entre deux valeurs 'min' et 'max'. Si 'min>max'
 les valeurs seront echangées. La saisie a lieu tand que l'utilisateur entre un entier incorrect. 
 La fonction renvoie le nombre d'essaisqui ont té nécessaires.
==

editor.code==


... saisiee( ...){
  /* Votre code ici... */
  printf( "entrez un entier compris entre %d et %d : ",min,max);
}

==

solution==
int saisie(int min,int max,int *n){
 int nb=1;
  if( min>max){
    int tmp;
    tmp=min;
    min=max;
    max=tmp;
    }
  printf( "entrez un entier compris entre %d et %d : ",min,max);
    scanf("%d",n);
do{
  printf( "entrez un entier compris entre %d et %d : ",min,max);
    scanf("%d",n);
    nb+=1;
 }while(*n<min || *n >max);
return nb;
}
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

int main(int argc, char* argv[]){
  int n,min,max,essai;
  min=atoi(argv[1]);
  max=atoi(argv[2]);
  essai=saisie(min,max,&n);
  printf("%d en %d essais\n",n,essai);

  return 0;
}


==

tests==
[["Exécution simple", "1 9", "5"],
 ["Quelques éléments", "12 2", "1 3"],
  ["Aléatoire",' '.join([str(random.randint(1, 24)),str(random.randint(1, 4))]), "0 1 5"]
 ]
==



