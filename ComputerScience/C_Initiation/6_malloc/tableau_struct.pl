# Revu par Clément BOIN le 19/10/2020
# Déplacement du typedef après les #defin sinon ça ne marche pas ici

title=Allocation d'un tableau à une dimension
tag=array|malloc
extends=/ComputerScience/C/template/stdsandboxC.pl
author=
text==
On a définit un type `Etudiant` permettant de mémoriser la fiche d'un étudiant.
Ecrire une fonction `allouetab`qui recoit un entier **size** et renvoie l'adresse d'une zone pouvant contenir 
**size**  `Etudiant`
==

editor.code==
... allouetab(...){
    /* Votre code à compléter ici */
}

==

solution==

Etudiant* allouetab(int size){
  Etudiant* ans = (Etudiant *)malloc( size * sizeof(Etudiant) );
  return ans;
}

==

codebefore==
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdio.h>

typedef struct{
char  nom[20];
int age;
}Etudiant;
==

codeafter==




int main(int argc, char* argv[]){
  int size = atoi(argv[1]);
  Etudiant* ans;

  srand(time(NULL));

  ans = allouetab(size);
  if (ans == NULL){
    printf("Not Enough Memory.\n");
    return 0;
  }
  if (size >= 2){
    strcpy(ans[0].nom ,"toto");
    ans[0].age=19;
    strcpy(ans[size-1].nom ,"titi");
    ans[size-1].age=91;
    }
  free(ans);
  return 0;
}

==

tests==

[["Exécution simple", "1", ""],
 ["Tableau vide", "0", ""],
 ["Tableau moyen", "46", ""],
 ["Aléatoire", str(random.randint(1, 1000000)), ""],
 ["Aléatoire", str(random.randint(1, 1000000000)), ""],
 ["Aléatoire", str(random.randint(1000000000, 2000000000)), ""]]

==











