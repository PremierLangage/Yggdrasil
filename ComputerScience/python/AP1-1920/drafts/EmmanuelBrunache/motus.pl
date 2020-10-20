
author=Emmanuel Brunache


title=Longueur de chaine
tag=string
extends=/ComputerScience/C/template/std_progC.pl

text==

Ecrire une fonction `int motus(char mystere[],char proposition[],int info_sortie[])` qui reçoit une chaine de caractères 'mystere' à découvrir, une chaine de caractères 'proposition' et un tableau d'entiers 'info_sortie' (de même taille que le mot mystère) se remplissant de la manière suivante pour le i-ème caractère de la proposition:
 - 0 si le caractère de la proposition n'est pas dans le mot mystere.
 - 2 si le caractère de la proposition est à la même place dans le mot mystère.
 - 1 si le caractère de la proposition existe dans le mot mystère mais n'est pas à la bonne place.

Attention: Si une lettre apparait n fois dans le mot mystère, on ne peut avoir au maximum que n chiffres différents de 0 dans info_sortie. Exemple: si le mot mystère est 'bonjour' et que la proposition est 'oooonnn', le tableau info_sortie sera 1200100.

Par ailleurs, la fonction renvoie 0 si la proposition n'est pas de la même taille que le mot mystère.
==
code_before==

#include <stdio.h>
#include <string.h>


==

taboo=string.h

editor.code==
/* ... */  motus(char mystere[],char proposition[],int info_sortie[]){
/* A compléter */
}

==

solution==
int motus(char mystere[],char proposition[],int info_sortie[]){
  int l_mys=strlen(mystere);
  int l_prop=strlen(proposition);
  if (l_mys!=l_prop){
    return 0;
  }
  int i;
  int j;
  for (i=0;i<l_mys;i++){
    info_sortie[i]=0;
    if (mystere[i]==proposition[i]){
      info_sortie[i]=2;
      mystere[i]='*';
    }
  }
  for (i=0;i<l_mys;i++){
    if (info_sortie[i]==0){
      for(j=0;j<l_mys;j++){
        if(proposition[i]==mystere[j]){
          info_sortie[i]=1;
          mystere[j]='*';
          break;
        }
      }
    }
  }
  return 1;
}

==

code_after==
int main(int argc, char* argv[]){
  char mystere[]=argv[1];
  char proposition[]=argv[2];
  int info_sortie[strlen(mystere)];
  int i;
  if(motus(mystere,proposition,info_sortie)){
  for(i=0;i<strlen(mystere);i++){
    printf("%d",info_sortie[i]);
  }
  printf("\n");
  printf("%s\n",mystere);
  } else {
    printf("la proposition n'est pas de la bonne taille");
  }
  return 0;
}
==


checks_args_stdin==#|python|
[ ["simple éxécution", ["bonjour","bonsoir"],""],
["alea",["".join([chr(randint(97,122)) for i in range(randint(1,15))])],""]]
==













