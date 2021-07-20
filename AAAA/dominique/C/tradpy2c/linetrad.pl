

extends= trad1.pl

extends= lines/linelist.pl

before2==
fname = 'l1'

==



code_before==
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){  
  int i=0;  
  int nb_term = argc-1; 
  for(;i<15;i++) {
==

code_after==#|c|

}

return 0;
}

==



  return 0;  
}  