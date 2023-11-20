

// PL:author=DR
/* PL:title= Facile  */
/* PL:text==

Ecrire une fonction **eval_f** qui prend en paramètre un flottant et 3 entiers (dans cet ordre) et qui retourne un flottant.
 

Votre fonction **eval_f** calcule la valeur de la fonction $%f(x)={latexcode}%$.

PL:== */


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

#ifndef PCODE
#define PCODE 0.0
#endif
// PL:==
// PL:solution==

float eval_f(float x, int a , int b , int c){
    return PCODE;
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


int main(int argc, char **v){
    if (argc < 2){
        printf("usage %s seed\n",v[0]);
        exit(1);
    }
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
/* PL:aleacode==

a=2
# this python code is executed in the buider to generate the code 
# to be compared to the student code
a=1
import random 

# expression en python et en latex 
posibilities = [("x*(a*a+b+c)","x*(a^2+b+c)")]
# choix d'une expression
pcode,latexcode = random.choice(posibilities)

solution = f"""#define PCODE {pcode}\n"""+solution

PL:== */



/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */