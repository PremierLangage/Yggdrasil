



/* PL:title= Facile  */
/* PL:text==

Ecrire une fonction **eval_f** qui prend en paramètre un flottant et 3 entiers (dans cet ordre) et qui retourne un flottant.
 

Votre fonction **eval_f** calcule la valeur de la fonction $%{latexcode}%$, ou $%x%$ est un flottant et a,b,c des entiers.

Rappel: $%z^y%$ est z à la puissance y. 

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
float eval_f(){

}

PL:== */

// PL:code_after==


void randomtest(){
    int e,f,g;
    float j;
    e =rand() % 10 - 5 ;
    f =rand() % 10 - 5 ;
    g =rand() % 10 - 5 ;
    j = 1.56712 * (rand()% 10);
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
# this python code is executed in the buider to generate the code 
# to be compared to the student code
import random 
# expression en python et en latex 
# C'est ici qu'il faut avoir des idées 

posibilities = [("x*(a*a+b*c)","f(x)=x(a^2+bc)"),
("a*x*x+b*x+c","f(x)=ax^2+bx+c"),
("a*x+b*x+c*x","f(x)=ax+bx+cx"),
("(a+x)*(a+x)+(b+c)*(b+c)*(b+c)","f(x)=(a+x)^2+(b+c)^3"),
("(a*x)*(a*x)*(a*x)+(b-c)*(b-c)","f(x)=(ax)^3+(b-c)^2"),
]
# choix d'une expression
if "pcode" not in globals():
    if "number" in globals() and int(number) in range(len(posibilities)):
        pcode, latexcode = posibilities[int(number)]
    else:
        pcode,latexcode = random.choice(posibilities)

solution = f"""#define PCODE """+pcode+"\n"+solution
PL:== */



/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */