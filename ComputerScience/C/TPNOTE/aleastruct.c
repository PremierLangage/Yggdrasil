




// PL:author=DR

/* PL:title= Facile  */
/* PL:text==

Voici la structure {structname}:

    {struct}
on nous demande d'ecrire la fonction de test 
   int test({struct} *p,{struct} q);

qui verifie la propriété {propriete} est vraie.

PL:== */


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

#ifndef STRUCTNAME
#define STRUCTNAME Truc
#define CHAMP age
#define PCODE (p->age < q.age)
#endif
// PL:==
// PL:solution==

int test(STRUCTNAME *p, STRUCTNAME q){
    return PCODE ;
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
("a*x*x+b*x+c","f(x)=ax^2+bx+c)"),
("a*x+b*x+c*x","f(x)=ax+bx+cx)"),
("(a+x)**2+(b+c)**3","f(x)=(a+x)^2+(b+c)^3"),
("(a*b)**2+(b-c)**5","f(x)=(ax)^2+(b-c)^5"),
]
# choix d'une expression
if "pcode" not in globals():
  pcode,latexcode = random.choice(posibilities)

solution = f"""#define PCODE """+pcode+"\n"+solution
PL:== */



/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */