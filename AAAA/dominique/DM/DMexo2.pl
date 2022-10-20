
extends=DMexo1.pl




title= DM - nombre de mines avoisinantes
tag=DM

text==#|markdown|
Écrire une function **nbmines_t** qui prend

- un entier représentant la hauteur du terrain
- un entier représentant la largeur
- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)
- un entier i
- un entier j

et qui retourne le nombre de mines sur les 8 cases adjacente de la case de coordonées i,j
avec le terrain suivant on a  
nbmines(...,0,1)-> 1  
nbmines(...,1,1)-> 2  
nbmines(...,2,2)-> 0  
nbmines(...,0,2)-> 1 ne pas compter la mine en 0,2


    0 0 9 9 0 9 0 0 0 0  
    0 2 0 3 0 0 0 0 0 0  
    0 1 9 0 0 0 0 0 0 0  
    0 0 0 0 0 0 0 0 9 9  
    0 0 0 0 0 0 0 0 9 0  
    0 0 0 0 0 0 0 0 0 0  

rappel: on réalise un https://fr.wikipedia.org/wiki/D%C3%A9mineur_(genre_de_jeu_vid%C3%A9o)

Remarque: On peut utiliser la fonction hasmine_t ....
==

editor.code==
int nbmines_t(  ){
    return 1;
}
==


code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
int **read_t(FILE *f, int *H, int *L, int *M)
{
    int **t;
    fscanf(f, "%d %d %d", H, L, M);
    t = malloc(*H * sizeof(int *));
    for (int i = 0; i < *H; i++)
    {
        t[i] = malloc(*L * sizeof(int));
    }

    for (int i = 0; i < *H; i++)
    {
        for (int j = 0; j < *L; j++)
        {
            fscanf(f, "%d", &(t[i][j]));
        }
    }
    return t;
}

int **alloc_t(int H, int L)
{ // calloc inits memory with zeros
    int **t = calloc(1, H * sizeof(int *));
    for (int i = 0; i < H; i++)
    {
        t[i] = calloc(1, L * sizeof(int));
    }
    return t;
}

// alloc and create a new terrain
int **random_t(int H, int L, int M, int seed)
{
    // alloc
    if (seed) srand(time(NULL));

    int **t = alloc_t(H, L);
    // random mines (M)
    for (int i = 0; i < M; i++)
    {
        int h, l;
        do
        {
            h = rand() % H;
            l = rand() % L;
        } while (t[h][l] == 9);
        t[h][l] = 9;
    }
    return t;
}
==



solution==

int hasmine_t(int h, int l, int *t[], int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    // mine ou mine sous drapeau
    return t[i][j] == 9 || t[i][j] == -9;
}


int nbmines_t(int h, int l, int *t[], int i, int j)
{
    return hasmine_t(h, l, t, i - 1, j - 1) + hasmine_t(h, l, t, i - 1, j) + hasmine_t(h, l, t, i - 1, j + 1) + hasmine_t(h, l, t, i, j - 1) + hasmine_t(h, l, t, i, j + 1) + hasmine_t(h, l, t, i + 1, j - 1) + hasmine_t(h, l, t, i + 1, j) + hasmine_t(h, l, t, i + 1, j + 1);
}

==


code_after==#|c|
// Idée du test
// lire un fichier et faire afficher le fichier
// l'etudiant doit ecrire la fonction print_t
int main(int argc, char* argv[]){
    int H=10,L=10,M=30,**t;
    int to[]={ 2,2, 1,2, 0,3, 2,0, 5,5, 0,0, 9,9}; 
    int i=0;
    int seed= ! strcmp(argv[1],"dense");
    if (seed==1) M *= 3;
    t= random_t(H,L,M,seed);
    if (! strcmp(argv[1],"full"))
        for(int j=0;j <H;j++)
            for(int i=0;i <L;i++)
                t[j][i]= 9;
    for (i=0; i < 14; i+=2) 
        printf("%d %d -> %d \n",to[i],to[i+1], nbmines_t(H,L,t,to[i],to[i+1]));

  return 0;
}

==



checks_args_stdin==#|python|
[["Test plus toto vide", ["clairseme"], ""],
["Test dense ", ["dense"], ""],
["Test full", ["full"],""]
]
==

astuces==#|python|
[]
==

