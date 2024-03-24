




// PL:title= Plus dur


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
typedef struct noeud {
   int valeur;
   struct noeud * fg, * fd;
} Noeud, * Arbre;


Arbre cn(int val,Arbre g,Arbre d){
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = val;
    a->fg = g;
    a->fd = d;
    return a;
}



int  addTree(Arbre *a, int val){
    if (!*a){
        *a = malloc(sizeof(Noeud));
        (*a)->valeur = val;
        (*a)->fg = NULL;
        (*a)->fd = NULL;
        return 1;
    }
    if (rand()%2)
        return addTree(&(*a)->fg, val);
    else
        return addTree(&(*a)->fd, val);
}

Arbre _BuildRandomTree(int *n){
    if (*n < 0)
        return NULL;
    Arbre a = calloc(sizeof(Noeud),1);
    a->valeur = rand() % 1000;
    (*n) -= 1;
    if (rand() % 2)
        a->fg = _BuildRandomTree(n);
    if (rand() % 2)
        a->fd = _BuildRandomTree(n);
  

    return a;
}

Arbre BuildRandomTree(int n){
     int v=n;
    Arbre a= _BuildRandomTree(&v);
    while (v > 0){
        v -= addTree(&a,rand() % 1000);
    }
    return a;
}

Arbre BuildRandomStrictlyBinaryTree(int n){
    if (n <= 0)
        return NULL;
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = rand() % 100;
    a->fg = BuildRandomStrictlyBinaryTree((n-1)/2);
    a->fd = BuildRandomStrictlyBinaryTree((n-1)/2);
    return a;
}

Arbre BuildTree(int n, int strict){
    if (! strict && (rand() % 10 > 3))
        return BuildRandomTree(n);
    //printf(" S");
    return BuildRandomStrictlyBinaryTree(n);
}

void printTree(Arbre a){
    if (!a)
        printf("X ");
    else {
    printf("%d ", a->valeur);
    printTree(a->fg);
    printTree(a->fd);
    }
}

// PL:==

/* PL:text==
On considère la structure suivante :

    typedef struct noeud {
    int val;
    struct noeud * fg, * fd;
    } Noeud, * Arbre;

Écrire une fonction **int plus_courte_branche(Arbre a)** 
qui renvoie la longueur de la branche la plus courte de l'arbre.

Celle-ci vas d'une feuille a la racine. 


Remarque: dans certains test la fonction 

    void printTree(Arbre a){
        if (!a)
            printf("X ");
        else {
        printf("%d ", a->valeur);
        printTree(a->fg);
        printTree(a->fd);
        }
    }

est utilisé pour afficher les arbres pour vous aider au débugage. 


PL:== */ 

// PL:solution==
int plus_courte_branche(Arbre a){
   int g, d;
   if (!a)
       return -1;
    if(!a->fg && !a->fd)
        return 0;
   g = plus_courte_branche(a->fg);
   d = plus_courte_branche(a->fd);
   if (-1 == d) /* Une feuille ou un unique fils gauche */
       return g + 1;
   if (-1 == g) /* Un unique fils droit */
       return d + 1;
   return 1 + ((g < d)? g: d); /* Deux fils */
}
// PL:== 

// PL:code_after==

Arbre unArbre(){
    return cn(10,// Noeud a 2 fils Niveau 0 Hauteur 3
            cn(5,// Noeud a 2 fils Niiveau 1 Hauteur 2
                cn(3,cn(1,NULL,NULL),NULL), // un fils + une feuille Niveau 2 et 3
                cn(7,NULL,NULL)), // une feuille Niveau 2 Hauteur 0 
            cn(15, // Noeud a 2 fils Niveau 1 Hauteur 1
                cn(12,NULL,NULL), // une feuille    Niveau 2 Hauteur 0
                cn(20,NULL,NULL))  // une feuille   Niveau 2 Hauteur 0
                );
}



int main(int argc, char const *argv[])
{

    if (argc < 2){
        printf("Usage: %s <seed>\n",argv[0]);
        return 1;
    }
    srand(atoi(argv[1]));
    int taille=1;
    Arbre a;
    for(int i=0;i < 5 ; i++){
        taille = (i+1)*10 + rand() % 10;
    if (i==0) a= unArbre();
    else a = BuildTree(taille,1);

   if (taille < 20) 
    { printf("\nArbre °%d parcours préfixe : ",i);
     printTree(a);
     printf("\n");
    }

    printf("Arbre %d la plus courte branche est de longueur %d\n",i, plus_courte_branche(a));
    printf("\n");
    
    }
    return 0;
}

// PL:==


/* PL:checks_args_stdin==
[["Test1" ,["12"],""], ["Test2" ,["33"],""],["Test3" ,["3945"],""],["Test4" ,["1418"],""]]
PL:== */


/* PL:aftersplit==

PL:== */

