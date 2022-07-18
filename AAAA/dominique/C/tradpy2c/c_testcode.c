/*

int c(int x, int y){ return x > y; }

*/


#include <stdio.h>
#include <stdlib.h>
#define CUT_HERE int Z88;
CUT_HERE

int main(int argc, char* argv[]){  
  int i=0;  
  int nb_term = argc-1;  

  for (i=0 ; i<nb_term ; i++){  
    printf("%s\n", FUNC(atoi(argv[i+1]),i) ? "oui":"non" );  
  }  

  return 0;  
}  