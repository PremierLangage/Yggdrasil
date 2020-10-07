
# Copyright 2020 DR
#author=  DR

author=

title=Recherche d'entiers dans un float

tag=Fonction|AppelFonction|TransmissionParametre|RetourFonction|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction *nextInteger* qui effectue la saisie d'un entier dans l'entrée standard (ce qui est tappé au clavier).

Tant que la réponse de la fonction **scanf** est nulle, il faut faire un appel à **getchar** pour consommer le caractère qui n'est pas
un digit (chiffre). 
La fonction *nextInteger* reçoit l'adresse de l'entier qui stockera la réponse de **scanf**.

Si l'entrée standard est "toto4  77!!23" le programme principal appelera 4 fois la fonction *nextInteger*
qui retournera "1" trois fois, puis "zéro" car il n'y a plus d'entiers quand l'entrée est vidée.

Remarque **scanf** retourne 0 si elle n'a pas pu lire, 1 si elle a lue un entier, -1 si il n'y a plus rien à lire.

==

editor.code==

int nextInteger(...){

}

==

solution==
int nextInteger(int *n){
int r=0;
while (!(r=scanf("%d",n))) getchar();
if (r==-1) return 0;
return 1;
}
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==


int main(int argc, char* argv[])
{
  int n=0,essai=0;
  while (nextInteger(&n)){
    printf("Entier trouvé :%d \n",n);
    essai++;
  }
  printf("%d entiers trouvés\n",essai);

  return 0;
}
==

tests==
[["Exécution simple", "1 9", "5"],
 ["Quelques éléments", "12 2", "Il y a quelque entiers 1 qui sont dans 3 ce texte, celui la 3.1415 c\'est un float donc 2 entiers."],
 ["Aléatoire","",'Vive '+' PLATON '.join([str(random.randint(1,4)),str(random.randint(11, 24)),str(random.randint(11, 24))])+" ."]
 ["Aléatoire","",'Vive '+' la L1 Math Info '.join([str(random.randint(1,4)),str(random.randint(11, 24)),str(random.randint(11, 24))])+" ."]
 ]
==














