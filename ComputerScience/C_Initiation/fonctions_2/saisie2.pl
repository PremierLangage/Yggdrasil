


# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#author=Nicolas Borie + DR

title=Saisie dans intervale

tag=Fonction|AppelFonction|TransmissionParametre|RetourFonction|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==
Écrire une fonction *saisie* qui effectue la saisie controlée d'un entier compris au sens large entre deux valeurs 'min' et 'max'. Si 'min>max'
 les valeurs seront echangées.  
 La saisie a lieu tant que l'utilisateur entre un entier incorrect. 
 La fonction renvoie le nombre d'essais qui ont été nécessaires.
 La fonction reçoit l'entier minimum, l'entier maximum et une transmission par adresse sur l'entier saisi à comparer aux min et max.
==

editor.code==


int saisie( int min, int max, int *n){

  printf("entrez un entier compris entre %d et %d : ", min, max);

  return /*Renvoie de la fonction*/;
}

==

solution==
int saisie(int min, int max, int *n){
 int nb=0;
  if( min>max ){
    int tmp;
    tmp=min;
    min=max;
    max=tmp;
    }
  printf("entrez un entier compris entre %d et %d : ", min, max);
do{
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
 ["Aléatoire",' '.join([str(random.randint(1,4)),str(random.randint(11, 24))]), "0 -1 5"]
 ]
==











