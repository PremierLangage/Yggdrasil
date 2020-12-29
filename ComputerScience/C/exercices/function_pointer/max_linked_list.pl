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

author=Nicolas Borie
title=Maximum générique d'une liste chaînée de personnes
tag=function|type|pointeur|function_pointer|difficile

text==
Écrire une fonction C **max_list** dont le prototype utilise la même stratégie que la fonction 
*qsort*. La fonction prendra en argument une liste chaînée de personnes (prénom, nom et age) 
mais aussi une fonction de comparaison. La fonction devra retourner l'adresse de la 
cellule contenant l'élément maximal de la liste chaînée, selon la fonction de 
comparaison. Si la liste est vide, votre fonction devra retourner **NULL**.

<br>

Pour rappel, une fonction de comparaison correcte vis à vis du langage C, 
évaluée sur des données X (premier argument) et Y (second argument) retourne un 
entier négatif, nul ou positif respectivement lorsque X < Y, X = Y ou X > Y.
Si la liste contient plusieurs occurences de son maximum, retournez l'adresse 
de la première cellule en partant de la tête qui réalise ce maximum.
==

editor.code==#|c|
typedef struct cell{
  char first_name[64];
  char last_name[64];
  int age;
  struct cell* next;
}Cell, *List;

Cell* max_list(List l, int (*compar)(const void *, const void *)){
  /* Votre code ici... */
}
==

solution==#|c|
typedef struct cell{
  char first_name[64];
  char last_name[64];
  int age;
  struct cell* next;
}Cell, *List;

Cell* max_list(List l, int (*compar)(const void *, const void *)){
  Cell* adr_max;
  for (adr_max = NULL ; l!=NULL; l = l->next ){
    if ((adr_max == NULL) || compar(adr_max, l) < 0)
      adr_max = l;
  }
  return adr_max;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
==

code_after==#|c|
const char first_n[][64] = {"Pierre", "Paul", "Jacques", "Alexandre", "Michel", "Paulette", "Emilie", "Elodie", "Jacquie", "Inès", "Manon", "Gustavo", "Line", "Gertrude", "Ginette", "Jean-Lou", "Clara", "Octave", "Sophie", "Mélanie", "Jean-Phillipe"};

const int nb_first_n = 21;

const char last_n[][64] = {"Tartenpion", "Faure", "Saccomano", "Los Del Rio", "Lopez", "Van Houten", "Benazzi", "Lim", "Valdmans", "Marconi", "Morgane", "Hergébel", "Fonfec", "Zétofrais", "Herbien"};

const int nb_last_n = 15;


Cell* random_cell(void){
  Cell* n = (Cell*)malloc(sizeof(Cell));

  if (n != NULL){
    strcpy(n->first_name, first_n[rand()%nb_first_n]);
    strcpy(n->last_name, last_n[rand()%nb_last_n]);
    n->age = rand()%100;
    n->next = NULL;
  }
  return n;
}

Cell* random_list(int length){
  Cell* l;
  if (length == 0)
    return NULL;
  l = random_cell();
  if ((length > 1) && (l != NULL)){
    l->next = random_list(length - 1);
  }
  return l;
}

void print_cell(Cell* c){
  printf("%s %s %d", c->first_name, c->last_name, c->age);
}

void print_list(List l){
  if (l == NULL)
    printf("NULL\n");
  else{
    print_cell(l);
    printf(" --> ");
    print_list(l->next);
  }
}

int comp_name(const void* a1, const void* a2){
  const Cell* c1 = (const Cell*)a1;
  const Cell* c2 = (const Cell*)a2;

  int diff = strcmp(c1->last_name, c2->last_name);
  if (diff)
    return diff;
  diff = strcmp(c1->first_name, c2->first_name);
  if (diff)
    return diff;
  return c1->age - c2->age;
}

int comp_name_minus(const void* a1, const void* a2){
  return -comp_name(a1, a2);
}

int comp_age(const void* a1, const void* a2){
  const Cell* c1 = (const Cell*)a1;
  const Cell* c2 = (const Cell*)a2;

  int diff = c1->age - c2->age;
  if (diff)
    return diff;
  diff = strcmp(c1->last_name, c2->last_name);
  if (diff)
    return diff;
  return strcmp(c1->first_name, c2->first_name);
}

int comp_age_minus(const void* a1, const void* a2){
  return -comp_age(a1, a2);
}

int main(int argc, char* argv[]){
  srand(atoi(argv[1]));
  List l = random_list(atoi(argv[2]));
  Cell* maxi;
  print_list(l);
  
  printf("MAX BY NAME: \n");
  maxi = max_list(l, comp_name);
  if (maxi)
    print_cell(maxi);
  else
    printf("NULL");
  putchar('\n');
  printf("MIN BY NAME: \n");
  maxi = max_list(l, comp_name_minus);
  if (maxi)
    print_cell(maxi);
  else
    printf("NULL");
  putchar('\n');

  
  printf("MAX BY AGE: \n");
  maxi = max_list(l, comp_age);
  if (maxi)
    print_cell(maxi);
  else
    printf("NULL");
  putchar('\n');
  printf("MIN BY AGE: \n");
  maxi = max_list(l, comp_age_minus);
  if (maxi)
    print_cell(maxi);
  else
    printf("NULL");
  putchar('\n');
  return 0;
}
==

checks_args_stdin==#|python|
[["Liste vide", ["1", "0"], ""],
 ["Test aléatoire 1", [str(randint(0,1000000)), str(randint(1,5))], ""],
 ["Test aléatoire 2", [str(randint(0,1000000)), str(randint(5,10))], ""],
 ["Test aléatoire 3", [str(randint(0,1000000)), str(randint(5,10))], ""],
 ["Test aléatoire 4", [str(randint(0,1000000)), str(randint(10,20))], ""],
 ["Test aléatoire 5", [str(randint(0,1000000)), str(randint(50,100))], ""],
 ["Test aléatoire 6", [str(randint(0,1000000)), str(randint(100,200))], ""] ]
==


