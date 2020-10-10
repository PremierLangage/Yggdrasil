title=Tableau Croissant

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|ComparaisonContigues

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

seed=random.randint(1,100)

text==

Écrire une fonction `est_croissante` qui reçoit un tableau de taille MAX (*) et renvoie 1
 si les entiers sont en ordre strictement croissant, et 0 sinon. <br>

<p>
Exemple
avec MAX valant 5 : <br>
- si tab contient $%-4,5,10,14,1%$, est_croissante(tab) renvoie $%0%$,<br>
- Si tab contient $%5,6,8,75,82%$, est_croissante(tab) renvoie $%1%$.<br>

<p>
(*) MAX est une constante symbolique définie par #define MAX XXXXX, où XXXXX est un entier positif.
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX (access_control())

/* a singleton kind of pattern */
int access_control()
{
  static int real_max = -1;
  if (real_max == -1)
    real_max = 5 + rand()%20;
  return real_max;
}

==

editor.code==
/* Retour */ est_croissante(/* Paramètres */){

}
==

solution==
int est_croissante(int tab[]){
  int i=1;
for(;i<MAX;i+=1){
    if (tab[i-1] >= tab[i])
      return 0;
      }
  return 1;
}
==

codeafter==
int main(int argc, char* argv[]){
  int tab[MAX];
  int lu;
  int i;
  int seed;
  scanf("%d",&seed);
  srand(seed);
  printf("constante MAX = %d\n",MAX);
  printf("tableau d'entrée : \n");
  for (i = 0; i < MAX; i++) {
    scanf("%d",&lu);
    tab[i] = lu;
    printf("%d ",lu);
  }
  printf("\n-->%d\n",est_croissante(tab));

  return 0;
}
==

# MAX était donné comme valeur comme en C dans les tests, ça faisait tout planter, il faut le mettre à la main
# les tests sont plus longs que MAX<=25 pour assurer qu'ils marchent dans tous les cas
# mais effectivement la seule partie qui compte c'est jusqu'à MAX
tests==
[ ["croissante 1", "",str(seed)+"\n"+" ".join([str(i) for i in range(25)])] ,
["presque croissante", "",str(seed)+"\n"+"1 "+" ".join([str(i) for i in range(25)])] ,
["pas stricte", "",str(seed)+"\n"+"0 "+" ".join([str(i) for i in range(25)])] ,
["aléatoire 1", "",str(seed)+"\n"+" ".join([str(random.randint(1,10)) for i in range(25)])] ,
["aléatoire 2", "",str(seed)+"\n"+" ".join([str(random.randint(1+2**i,2**(i+1))) for i in range(25)])] ,
["aléatoire 3", "",str(seed)+"\n"+" ".join([str(random.randint(2**i,3*2**(i))) for i in range(25)])] ,


]
==























