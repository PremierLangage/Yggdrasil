


/* PL:title= Facile  */
/* PL:text==

Ecrire une fonction **eval_f** qui prend en paramètre un flottant et 3 entiers (dans cet ordre) et qui retourne un flottant.
 

Votre fonction **eval_f** calcule la valeur de la fonction $% f(x) = abx+bcx+acx %$ pour x = x0.

PL:== */


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>


// PL:==
// PL:solution==

float eval_f(float x, int a , int b , int c){
    return a*b*x+b*c*x+a*c*x;
}

// PL:==

/* PL:code==
void eval_f(){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// PL:code_after==


void randomtest(){
    int e,f,g;
    float j;
    e =rand() % 100;
    f =rand() % 100;
    g =rand() % 10;
    j = 2.0 * (rand()% 100);
    printf("eval_f(%.2f,%d,%d,%d) = %.2f\n",j,e,f,g,eval_f(j,e,f,g));
}


int main(int c, char **v){
    srand(atoi(v[1]));
    printf("eval_f(1.0,1,-1,1) = %.2f\n",eval_f(1.0,1,-1,1));
    printf("eval_f(2.0,2,-1,-1) = %.2f\n",eval_f(2.0,2,-1,-1));
    randomtest();
    randomtest();
    randomtest();
    randomtest();
    return 0;
}


// PL:==

/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */