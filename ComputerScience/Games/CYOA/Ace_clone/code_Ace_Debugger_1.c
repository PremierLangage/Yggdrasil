#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define TAILLE 20
#define MAX 100

void affichetab(int tab[], int taille){
  int i;

  for(i=0 ;i<taille;i++)
    printf("%d ", tab[i]);
  putchar('\n');
}

void tribulle(int* T, int taille){
  int i,j;
  int tmp;

  for(i=0;i<taille;i++){
    for(j=0;j<taille-i;j++){
          if(T[j+1] < T[j]){
	    tmp = T[j];
	    T[j] = T[j+1];
	    T[j+1] = tmp;
          }
    }
  }
}

int main(){
  int tab[TAILLE];
  int i;

  srand(time(NULL)); /* Le prof a dit de coller ca... */
  
  for (i=0 ; i<TAILLE;i++)
    tab[i]=rand()%MAX;
affichetab(tab, TAILLE);
 tribulle(tab, TAILLE);
affichetab(tab, TAILLE);
  
  return 0;
}
