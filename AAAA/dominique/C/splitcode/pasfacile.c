


// PL:title= Echauffement un arbre binaire 


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
typedef struct noeud {
   int valeur;
   struct noeud * fg, * fd;
} Noeud, * Arbre;





Arbre BuildRandomTree(int n){
    if (n <= 0)
        return NULL;
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = rand() % 100;
    if (rand() % 2)
        a->fg = BuildRandomTree(n-1);
    else
        a->fg = NULL;
    if (rand() % 2)
        a->fd = BuildRandomTree(n-1);
    else
        a->fd = NULL;
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

Arbre BuildTree(int n){
    if (rand() % 10 > 3)
        return BuildRandomTree(n);
    printf(" ");
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
        int valeur;
        struct noeud * fg, * fd;
        } Noeud, * Arbre;

vous devez seulement : 

PL:== */ 


// PL:sol1==
int hauteur(Arbre a){
   int g, d;
   if (!a)
       return -1;
   g = hauteur(a->fg);
   d = hauteur(a->fd);
   return 1 + ((g > d)? g: d);
}
// PL:== 

// PL:sol2==
int nb_feuilles(Arbre a){
   if (!a)
       return 0;
   if (a->fg==NULL && a->fd == NULL)
       return 1;
   return nb_feuilles(a->fg) + nb_feuilles(a->fd);
}
// PL:== 

// PL:sol3==
int nb_fils_unique(Arbre a){
   if (!a)
       return 0;
   if (a->fg && a->fd)
       return nb_fils_unique(a->fg) + nb_fils_unique(a->fd);
   if (a->fg || a->fd)
       return 1 + nb_fils_unique(a->fg) + nb_fils_unique(a->fd);
   else
       return 0;
}
// PL:== 

// PL:sol4==
int est_strictement_binaire(Arbre a){
   if (!a)
       return 1;
   if ((!a->fg && a->fd) || (a->fg && !a->fd))
       return 0;
   return est_strictement_binaire(a->fg) && est_strictement_binaire(a->fd);
}
// PL:== 

// PL:code_after==
int main(int argc, char const *argv[])
{
    Arbre a = NULL;
    int test= atoi(argv[1]);
    srand(atoi(argv[2]));
    for(int i=0;i < 1 ; i++){
        switch(test){
            case 1: a=NULL; break;
            case 2: a = malloc(sizeof(Noeud));
                    a->valeur = rand() % 100;
                    a->fg = NULL; a->fd = NULL;
                    break;
            case 3: a= BuildTree(25);break;
            case 4: a= BuildTree(100); break;
            case 5: a= BuildTree(100); break;
        }
     

    if (test==3) { printf("arbre parcourt préfixe : "); printTree(a);}


#if FUNCNUM == 1
            printf("Arbre °%d Hauteur de l'arbre %d\n",i, hauteur(a));
#endif
#if FUNCNUM == 2
            printf("Arbre °%d Nombre de feuilles = %d\n",i, nb_feuilles(a));
#endif
#if FUNCNUM == 3
            printf("Arbre °%d Nombre de fils uniques = %d\n",i, nb_fils_unique(a));
#endif
#if FUNCNUM == 4
            printf("Arbre °%d est strictement binaire: %s\n",i, est_strictement_binaire(a)?" Vrai ":" Faux ");
#endif
    }

    return 0;
}

// PL:==


/* PL:checks_args_stdin==
[["Test1 vide" ,["1", "12"],"1"], ["Test2 arbre une feuille" ,["2","33"],"2"],["Test3" ,["3","3945"],""],["Test4" ,["4", "1418"],""],["Test5" ,["4", "78"],""],["Test6" ,["4", "10"],""]]
PL:== */


/* PL:aftersplit==
import random
VERSION=random.randint(1,4)
cflags=[f"-DFUNCNUM={VERSION}"]
QUESTIONS=["Pas de question","Écrire la fonction **int hauteur(Arbre a)**.",
"Écrire la fonction **int nb_feuilles(Arbre a)** qui compte le nombre de noeuds qui sont des feuilles.",
"Écrire la fonction **int nb_fils_unique(Arbre a)** qui compte le nombre de noeuds qui sont des noeuds interne à un seul fils.",
"Écrire la fonction **int est_strictement_binaire(Arbre a)** qui vérifie que tout les noeuds on un nombre pair de fils."
]

solution = globals()["sol"+str(VERSION)]

text += QUESTIONS[VERSION]


PL:== */