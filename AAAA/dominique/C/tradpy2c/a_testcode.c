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


  for (i=0 ; i<nb_term ; i++){
     FUNC(atoi(argv[i+1]));
  }

  return 0;
}
