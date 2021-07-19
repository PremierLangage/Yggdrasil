/*

void a(int n)
{
    printf("%d\n",n);
}

*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int i=0;
  int nb_term = argc-1;
  int* tab = (int*)malloc(nb_term*sizeof(int));

  for (i=0 ; i<nb_term ; i++){
    tab[i] = a(atoi(argv[i+1]));
  }

  return 0;
}
