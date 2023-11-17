



/* PL:title= Facile  */
/* PL:text==

Ecrire une fonction **eval_f** qui prend en paramètre un flottant et 3 entiers (dans cet ordre) et qui retourne un flottant.
 

Votre fonction **eval_f** calcule la valeur de la fonction 

    $%f(x) = abx+bcx+acx%$.


Attention rappelez vous que 
$%x \* x * x * x * x * x%$ 
n'est pas nécessairement égal à $%(x * x * x) * (x * x * x)%$.
il est donc nécessaire de traduire directement 
l'expression mathématique sous la forme demandée.

PL:== */


// code avant 
// les trois parties code_before solution et code_after sotn concaténés 
// dans un fichier qui est compilé et dont l'exécution est comparée 
// a l'execution de la concaténation de code_before student_code et code_after

// PL:code_before==
#include <stdio.h>
#include <stdlib.h>


// PL:==

// le code solution dont l'exéction est comparée à celui de l'élève
// PL:solution==

float eval_f(float x, int a , int b , int c){
    return a*b*x+b*c*x+a*c*x;
}

// PL:==

// en théorie ceci soit apparaitre dans l'iteur de l'élève
// mais il y a un BUG donc cela ne marche pas
/* PL:code==
void eval_f(){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// le code suivant est la partie test qui doit fournir une sortie standard 
// suffisante pour comparer les deux exécutions 
// PL:code_after==


void randomtest(){
    int e,f,g;
    float j;
    e =rand() % 100;
    f =rand() % 100;
    g =rand() % 10;
    j = 2.0 * (rand()% 100);
    printf("eval_f(%.2f,%d,%d,%d) = %.4f\n",j,e,f,g,eval_f(j,e,f,g));
}


int main(int c, char **v){
    srand(atoi(v[1]));
    printf("eval_f(1.0,1,-1,1) = %.4f\n",eval_f(1.0,1,-1,1));
    printf("eval_f(2.0,2,-1,-1) = %.4f\n",eval_f(2.0,2,-1,-1));
    randomtest();
    randomtest();
    randomtest();
    randomtest();
    return 0;
}

// PL:==

// Cette balide permet de définir les tests a faire 
// chaque test est une liste (ou tuple) 
// [ 'nom du test', ['arguments', 'appel','du', 'programme','de','test'], "entrée standard "]
// dans l'exemple si dessous seul argv[1] est important et doit être un entier
/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */
