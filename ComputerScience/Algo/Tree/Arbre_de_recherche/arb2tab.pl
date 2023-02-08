



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


void construire_tableau(Tree a, int *t, int *i, int *size) {
    if (a != NULL) {
        construire_tableau(a->left, t, i,size);
        t[*i] = a->value;
        if (*i == *size - 1) {
            *size *= 2;
            t = (int *)realloc(t, *size * sizeof(int));
        }
        (*i)++;
        construire_tableau(a->right, t, i,size);
    }
}


==

solution==
// Construire un tableau trié a partir d'un Tree 

void construire_tableau(Tree a, int *t, int *i, int *size) {
    if (a != NULL) {
        construire_tableau(a->left, t, i,size);
        t[*i] = a->value;
        if (*i == *size - 1) {
            *size *= 2;
            t = (int *)realloc(t, *size * sizeof(int));
        }
        (*i)++;
        construire_tableau(a->right, t, i,size);
    }
}


==

code_after==#|c|


int main(int argc, char* argv[]){
  Tree tree=NULL;
  int *t = malloc(sizeof(int));
  int size=1;
  int index=0;
  build_tree(&tree);
  construire_tableau(tree, &t, &index, &size);
  for(size=0; size < index; size++)
    fprintf(stderr,"%d ",t[size]);
  fprintf(stderr,"Nombre de reallocation: %d",nbrealloc);
return 0;
}


==