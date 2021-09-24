#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Miroir d'un tableau

tag=tableau|fonction|astuce

extends=/ComputerScience/C/template/stdsandboxC.pl

author=Prog C L2 Team

text==#|markdown|
Écrire une fonction `miroir` qui reçoit deux tableaux d'entiers de même taille 
ainsi que l'entier C donnant leur taille. La fonction devra remplir le deuxième avec l'image 
miroir du premier.

<br>

<u>Exemple :</u> Si le premier tableau de taille `5` contenait `[1,2,3,4,5]`, le deuxième contiendra 
les valeurs `[5,4,3,2,1]` après éxécution de la fonction.
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>

==

editor.code==#|c|
... miroir(...){
  // Votre code ici...
}
==

solution==#|c|
void miroir(int tab[],int res[], int size){
  int i;

  for(i=0 ; i<size ; i++){
        res[i]=tab[size-i-1];
  }
}
==

code_after==#|c|

int main(int argc, char* argv[]){
  int tab[100],res[100];
  int size = 0;
  int lu,i;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }
miroir(tab,res,size);
for(i=0;i<size;i+=1)
    printf("%d ",res[i]);
  printf("\n");

  return 0;
}
==

checks_args_stdin==#|python|
[ ["simple éxécution", "","1 2 3 4 5"],
   ["aléatoire1 ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire2 ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==
