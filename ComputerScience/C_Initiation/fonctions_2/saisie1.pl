



# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#author=Nicolas Borie + DR

title=Saisie d'un entier

tag=Fonction|AppelFonction|TransmissionParametre|RetourFonction|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==
Écrire une fonction *saisieEntier* qui effectue la saisie d'un entier .
 La saisie a lieu tant que l'utilisateur entre un entier incorrect. 
 La fonction renvoie si oui ou non la lecture c'est bien passée. 
 
 La fonction reçoit l'adresse sur l'entier où placer la saisie.

    The **scanf** function return the number of input items successfully matched and assigned,
     which can be fewer than provided for, or even zero in the event of an early matching failure. 

==

editor.code==


int saisieEntier(...){


  return /*Renvoie de la fonction*/;
}

==

solution==
int saisieEntier(int *n){
return scanf("%d",n);
}
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

int main(int argc, char* argv[]){
  int n,essai=0;
  while (essai==0)
    {
     essai=saisieEntier(&n);
     getchar(); /* . . consommation de l'entrée standard */
    }
  printf("%d en %d essais\n",n,essai);

  return 0;
}


==

tests==
[["Exécution simple", "", "t5"],
 ["Quelques éléments", "", "1 3"],
 ["Aléatoire",' '.join([str(random.randint(1,4)),str(random.randint(11, 24))]), "0 -1 5"]
 ]
==













