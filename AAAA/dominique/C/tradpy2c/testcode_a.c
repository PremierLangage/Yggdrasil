/*

void a(int n)
{
    printf("%d\n",n);
}

*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int i=0;

  for (i=0 ; i<nb_term ; i++){
    printf("%d\n", f(atoi(argv[i+1])));
  }

  return 0;
}
