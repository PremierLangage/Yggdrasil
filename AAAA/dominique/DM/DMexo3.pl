
extends=DMexo1.pl




title= Test de fin de partie 


text== 

Quand le nombre de drapeau est égale au nombre de mines.   
Et que les drapeaux sont biens placés le joueur à gagné !  

La fonction **victoire** prend en parametre :  
- la grille  
- un entier avec le nombre de mines  
- deux entiers représentant les dimensions de la grille  
 

et retourne  
oui(1) si la grille contient une configuration de victoire,  
si par contre le nombre de drapeaux est égal aux nombre de mines mais qu'un drapeau est mal placé retourne (-1) BOOM !!  
sinon retourne 0 dans les autres cas.

==


editor.code==
int victoire(int **t,int m, int h, int l){
    int n=0;
    int bad=0;
    for(int i=0; i < h; i++)
        for(int j=0; j <l ; j++){
            if (t[i][j]== -9 )
                n++; 
            if ( t[i][j]== -10)
                {n++; bad++; }

            }
    if (n != m) return 0;
    if (bad) return -1;
    return 1;

}
==

solution== 
int victoire(int **t,int m, int h, int l){
    int n=0;
    int bad=0;
    for(int i=0; i < h; i++)
        for(int j=0; j <l ; j++){
            if (t[i][j]== -9 )
                n++; 
            if ( t[i][j]== -10)
                {n++; bad++; }

        }
    if (n != m) return 0;
    if (bad) return -1;
    return 1;

}
==

code_before==
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>


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
int **random_victory(int H, int L, int M, int seed, int val)
{
    // alloc
    int **t = alloc_t(H, L);
    // random mines (M)

    if (seed) srand(time(0));

    for (int i = 0; i < M; i++)
    {
        int h, l;
        do
        {
            h = rand() % H;
            l = rand() % L;
        } while (t[h][l] == val);
        t[h][l] = val;
    }
    return t;
}

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





==

code_after==
int main(int argc, char* argv[]){
    int H=10,L=10,M=30,**t;
    int seed=1;
    int v=0;
    if (! strcmp(argv[1],"notvictory.ga"))
    {
    t =read_t(fopen("notvictory.ga","r"), &H, &L, &M);
    }
    else if (! strcmp(argv[1],"rvic"))
    {
    t= random_victory(H,L,M,seed, -9);
    }
    else {
    t =random_victory(H,L,M,seed,9);
    }
    v  = victoire(t,H,L,M);
    switch(v){
    case 0:  printf("Dud\n"); break;
    case 1: printf("Victoire \n"); break;
    case -1: printf("Boom !! \n");
    }

  return 0;
}



==

@ notvictory.ga

astuces==#|python|
[]
==
