
/*

int b(int p, int q){

    return p+q;
}

*/



#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int i=0;
  int nb_term = argc-1;


  for (i=0 ; i<nb_term ; i++){
    printf("%d", FUNC(atoi(argv[i+1]),i) );
  }

  return 0;
}
