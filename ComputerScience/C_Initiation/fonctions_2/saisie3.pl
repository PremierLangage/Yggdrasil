
# Copyright 2020 DR
#author=  DR

author=

title=Recherche d'entiers dans un flot alphanumérique

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

#Proposition :
#
#Écrire une fonction *nextInteger* qui effectue la saisie d'un entier dans l'entrée standard (ce qui est tappé au clavier), même si d'autres caractères sont écrits (autres que des nombres).
#
#La fonction doit retourner 0 si elle n'a rien à lire sur l'entrée standard et 1 si elle a pu lire un entier.
#La fonction *nextInteger* reçoit l'adresse de l'entier qui stockera la réponse de **scanf**.
#Remarque **scanf** retourne 0 si elle n'a pas pu lire, 1 si elle a lue un entier, -1 si il n'y a plus rien à lire.
#
#Par exemple, si l'entrée standard contient "toto4  77!!23", la fonction *nextInteger* sera d'abord appelée sur "toto4" : elle passera tous les caractères alphabétiques grâce au **getchar**
#puis lira le "4" grâce à un **scanf** et retourne 1 puisque l'entrée standard n'était pas vide. La fonction est rappelée  puis passe les deux espaces (via le **getchar**) puis lit le "77" via un **scanf** et retourne 1 puisque l'entrée standard n'était pas vide.
#La fonction est à nouveau appelée pour passer les deux "!!" puis lire "23" et retourne 1 puisque l'entrée standard n'était pas vide. Puis la fonction est appelée une dernière fois pour retourner 0 puisque l'entrée standard est vide.
#
#Autre remarque : votre fonction doit lire sur l'entrée standard, donc si aucune lecture n'est faite,
#le programme restera en attente que les entrées soient lues. Ainsi, si toutes les entrées
#ne sont pas lues, le programme sera bloqué en attente et sera tué automatiquement au bout de 10 secondes.

editor.code==

int nextInteger(/* Paramètres */){

}

==

solution==
int nextInteger(int *n){
  int r=0;
  while (!(r=scanf("%d",n))) 
    getchar();
  if (r==-1)
    return 0;
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
#tests==
#[["Exécution simple", "1 9", "5"]],
# ["Quelques éléments", "12 2", "Il y a quelque entiers 1 qui sont dans 3 ce texte, celui la 3.1415 c\'est un float donc 2 entiers."],
# ["Aléatoire","",'Vive '+' PLATON '.join([str(random.randint(1,4)),str(random.randint(11, 24)),str(random.randint(11, 24))])+" ."]
# ["Aléatoire","",'Vive '+' la L1 Math Info '.join([str(random.randint(1,4)),str(random.randint(11, 24)),str(random.randint(11, 24))])+" ."]
#]
#==


#tests==
#[["Exécution simple", "1 9", "5"]]
#==

tests==
[["Exécution simple", "", "5"],
 ["Quelques éléments", "", "Il y a quelque entiers 1 qui sont dans 3 ce texte, celui la 3.1415 c\'est un float donc 2 entiers."],
 ["Aléatoire","",'Vive '+' PLATON '.join([str(random.randint(1,4)),str(random.randint(11, 24)),str(random.randint(11, 24))])+" ."],
 ["Aléatoire","",'Vive '+' la L1 Math Info '.join([str(random.randint(1,4)),str(random.randint(11, 24)),str(random.randint(11, 24))])+" ."],
 ]
==















