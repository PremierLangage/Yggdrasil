

extends= trad1.pl

extends= lines/linelist.pl

before2==
fname = 'l1'

==



code_before==
#include <stdio.h>
#include <stdlib.h>

void f(int n, int p,  int q){
==

code_after==#|c|

}




==