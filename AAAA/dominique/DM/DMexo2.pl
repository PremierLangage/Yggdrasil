
extends=DMexo1.pl




title= DM - Print terrain 
tag=DM

text==#|markdown|
Écrire une function **nbmines_t** qui prend  

- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)  
- un entier representant la hauteur du terrain  
- un entier la largeur  
- un entier i  
- un entier j  
et qui retourne le nombre de mines sur les 8 cases adjacente de la case de coordonées i,j
avec le terrain suivant on a  
nbmines(...,0,1)-> 1  
nbmines(...,1,1)-> 2  
nbmines(...,2,2)-> 1  
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

code_after==#|c|
// Idée du test
// lire un fichier et faire afficher le fichier
// l'etudiant doit ecrire la fonction print_t
int main(int argc, char* argv[]){
    int H=10,L=10,M=10,**t;
    int seed= ! strcmp(argv[1],"alea");
    t= random_t(H,L,M,seed);
    print_t(H,t,L);


  return 0;
}

==


solution==



==


checks_args_stdin==#|python|
[["Test basique", ["not alea"], "1 2"],
["Test encore ", ["alea"], ""]
]
==

