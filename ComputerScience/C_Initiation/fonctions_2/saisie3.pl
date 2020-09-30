


# Copyright 2020 DR
author=  DR

title=Recherche d'entiers dans un flot

tag=Fonction|AppelFonction|TransmissionParametre|RetourFonction|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==
Écrire une fonction *nextInteger* qui effectue la saisie  d'un entier dans l'entrée standard (ce qui est tappé au clavier).

Tant que la réponce de la fonction **scanf** est nulle, il fut faire un appel a **getchar** pour consomer le caractère qui n'est pas un digit (chiffre). 
 La fonction *nextInteger* reçoit l'adresse de l'entier qui sockera la réponse de scanf.

 Si l'entrée standard est "toto4  77!!23" le programme principal appelera 4 fois la fonction *nextInteger*
  qui retourne 1 si elle a trouvé un entier et zéro sinon.


==

editor.code==


int saisie( int min, int max, int *n){

  printf("entrez un entier compris entre %d et %d : ", min, max);

  return /*Renvoie de la fonction*/;
}

==

solution==
int nextInteger(int *n){
int r=0;
while (!(r=scanf("%d",n))  getchar();
if (r==-1) return 0;
return 1;
}
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

int main(int argc, char* argv[]){
  int n=0,essai=0;
  while (nextInteger(&n))
  { 
    print("Entier trouvé :%d \n",n);
    essai++;
  }
  printf("%d essais\n",essai);

  return 0;
}


==

tests==
[["Exécution simple", "1 9", "5"],
 ["Quelques éléments", "12 2", "1 3"],
 ["Aléatoire",' '.join([str(random.randint(1,4)),str(random.randint(11, 24))]), "0 -1 5"]
 ]
==












