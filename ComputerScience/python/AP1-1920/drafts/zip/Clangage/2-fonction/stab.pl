


title=Programme manipulant des types
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction 'saisie_crissante' qui reçoit un tableau de MAX entiers  et le remplit avec MaX entiers saisis en ordre strictemnt croissant. <br>
Les entiers formant une suite non croissantes seront ignorés.
 Exemple
Entrez  5 entiers en ordre croissant:<br>
-4 12 10 14 1 4 18 19
MAX est une macro-constante pré-définie

==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX 5
==

editor.code==
saisie_croissante()
==

solution==
void saisie_croissante(int tab[]){
  int i=1;
  int val;
  scanf("%d",&tab[0]);
while (i<MAX){
  scanf("%d",val);
    if (tab[i-1]<val ){
      tab[i]=val;
      i+=1;
      }
  }
}
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }

  printf("Le maximum des entiers reçus ur l'entrée standard est %d\n", max(tab, size));

  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
  ["avec deux négatifs", "","-1 -2"],
  ["aléatoire négatif", ""," ".join([str(random.randint(-30,-5)) for i in range(random.randint(5,10))])],
  ["aléatoire positif", ""," ".join([str(random.randint(0,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-100,100)) for i in range(random.randint(10,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==




