



extends= appartient.pl

title= Convertion d'un arbre en tableau

text==

Ecrire la fonction **void construire_tableau(Tree a, int *t, int *i, int *size)** qui remplie le tableau **t** avec les valeur de l'arbre dans l'ordre croissant.

Si le tableau est trop petit il est réalloué a une taille double. 

On utilisera le type   
typedef struct node{  
  int value;  
  struct node * left;  
  struct node * right;  
}Node, *Tree;  

==

editor.code==

void construire_tableau(Tree a, int *t, int *i, int *size){
// héhé 
}

==

solution==
// Construire un tableau trié a partir d'un Tree 
void construire_tableau(Tree a, int *t, int *i, int *size) {
    if (a != NULL) {
        construire_tableau(a->fg, t, i);
        t[*i] = a->val;
        if (*i == *size - 1) {
            *size *= 2;
            t = (int *)realloc(t, *size * sizeof(int));
        }
        (*i)++;
        construire_tableau(a->fd, t, i);
    }
}
int nbrealloc=0;
void *dobob(void *p, int size){
    nbrealloc++;
    return realloc(p,size);
}

#define realloc dobob
==

code_after==#|c|


int main(int argc, char* argv[]){
  Tree t=NULL;


  build_tree(&t);
  if(appartient(t,4))
    printf(" 4 appartient à l'arbre \n");
else
   printf(" 4 n'appartient pas à l'arbre \n");
 if(appartient(t,42))
    printf(" 42 appartient à l'arbre \n");
else
   printf(" 42 n'appartient pas à l'arbre \n");
return 0;
}


==