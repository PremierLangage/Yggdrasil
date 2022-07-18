
#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl


#author=Marc Zipstein
title=Codage d'un arbre de Huffman
tag=recherche

editor.height=300px

text== 
Ecrire une fonction **code_arbre** qui reçoit un arbre et l'indice de la racine et renvoie une chaine de caractere
contenant le code de l'arbre. Pour simplifier le code est écrit sur des octets (avec des char) et non bit a bit;on utilise les conventions:
	0 désigne un nnoeud interne
	1  désigne une feuille
	[z] désigne le code ascii de la lettre z.
==
editor.code==#|c|
void code_arbre_aux(Noeud* a,int racine,int indice,int*i,char *s){
   if(indice >(racine)/2)/*noeud interne*/{
     s[*i]='0';(*i)++;
    s[*i]='\0';
    code_arbre_aux( a, racine,a[indice].gauche,i,s);
    code_arbre_aux( a, racine,a[indice].droit,i,s);
 }
 else{
   s[*i]='1';(*i)++;
   s[*i]='[';(*i)++;
   s[*i]=a[indice].lettre;(*i)++;
   s[*i]=']';(*i)++;
   s[*i]='\0';
 }
}

char * code_arbre(Noeud* a,int racine){
static  char s[512];
    int i=0;
  
    s[0]='\0';
    code_arbre_aux(a,racine,racine,&i,s);  
    s[i]='\0';
    return s;
}
==

solution==#|c|
void code_arbre_aux(Noeud* a,int racine,int indice,int*i,char *s){
   if(indice >(racine)/2)/*noeud interne*/{
     s[*i]='0';(*i)++;
    s[*i]='\0';
    code_arbre_aux( a, racine,a[indice].gauche,i,s);
    code_arbre_aux( a, racine,a[indice].droit,i,s);
 }
 else{
   s[*i]='1';(*i)++;
   s[*i]='[';(*i)++;
   s[*i]=a[indice].lettre;(*i)++;
   s[*i]=']';(*i)++;
   s[*i]='\0';
 }
}

char * code_arbre(Noeud* a,int racine){
static  char s[512];
    int i=0;
  
    s[0]='\0';
    code_arbre_aux(a,racine,racine,&i,s);  
    s[i]='\0';
    return s;
}

==



code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct noeud{
  char lettre;
  int frequence;
int gauche;
int  droit;
}Noeud;
==

code_after==#|c|
int main(int argn,char *argv[]){
  int racine,i;
  Noeud *arbre;
  char *s;
  printf("racine :");
  scanf("%d",&racine);
  arbre=malloc(racine*sizeof(Noeud));
  if(arbre !=NULL){
    for(i=0;i<=(racine)/2;i++){
      printf("lettre frequence :\n");
      scanf(" %c %d",&(arbre[i].lettre),&(arbre[i].frequence));
      arbre[i].gauche=-1;
    }
    for (;i<=racine;i++){
      printf("noeud interne %d\n",i);     
      scanf("%d%d%d",&(arbre[i].frequence),&(arbre[i].gauche),&(arbre[i].droit));
      }
    s=code_arbre(arbre,racine);
    printf("cod e apres %s\n",s);free(arbre);
  }
    return 0;
}
==



checks_args_stdin==#|python|
	[
    ["Arbre 2 feuilles","","2 a 4 b 5 9 0 1"],
    ["Arbre","","8 a 1 b 2 " +choice(['c','f','t','z'])+ " 6 d 12 e 24 5 0 1 11 5 2 23 6 3 45 7 4" ],
    ["13 noruds","","12 a 1 b 1 c 2 d 2 e 8 f 10 g 10 2 0 1 4 2 3 6 7 8 11 9 4 20 5 6 31 10 11"],
	]
==
