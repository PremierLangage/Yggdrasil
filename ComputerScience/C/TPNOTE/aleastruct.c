




// PL:author=DR

// PL:title= Tiens des structures
/* PL:text==

Voici la structure suivante:

    {struct}

on nous demande d'ecrire la fonction de test 

    int test({structname} *p,{structname} q);

qui verifie que 

    {propriete}

 est vraie pour p par rapport à q.



PL:== */


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

#ifndef STRUCTNAME
#define STRUCTNAME Truc
typedef struct _ {
    int age;
    int puiss;
} Truc;
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

void init(STRUCTNAME *z, int x, int y)
{
    z->CHAMP = x;
    z->CHAMP2 = y;
}



int main(int argc, char **argv)
{
    STRUCTNAME p,q;
    switch(argv[1][0])
    {
    case 'a':
        init(&p,12,2017);
        init(&q,18,2018);
        printf("Test a %s\n", test(&p,q)? "True":"False");
    break;
    case 'b':
        init(&p,11,2018);
        init(&q,18,2019);
        printf("Test b %s\n", test(&p,q)? "True":"False");
    break;
    case 'c':
    init(&p,11,2018);
    init(&q,11,2019);
    printf("Test c %s\n", test(&p,q)? "True":"False");
    break;
    case 'd':   
    init(&p,11,2019);
    init(&q,11,2018);
    printf("Test d %s\n", test(&p,q)? "True":"False");
    return 0;
    }
}


// PL:==
/* PL:aleacode==


import random


namelabels=[("CampingCar","cc"),("TraitePhilosophique","tp"),("SousMarin","sm"),("Avion","av"),("AuteurSF","asf")]
structlist = [
"""
    // camping car 
    typedef struct cc {
        int nb_places;
        int puissance;
        char immatriculation[8];
        int annee_achat; // AAAA
        char marque[8];
    } CampingCar;
""",
"""
    // traité de phylosophie 
    typedef struct tp {
        int nb_pages;
        char titre[128];
        char auteur[128];
        int annee_edition;  
        char editeur[128];
    } TraitePhilosophique;
""",
"""
    // Sous marin
    typedef struct sm {
        int nb_torpilles;
        int puissance;
        char immatriculation[8];
        int annee_achat;  
        int propulsion; // 0 = diesel, 1 = nucléaire
    } SousMarin;
""",
"""
    // Avion
    typedef struct av {
        int nb_places;
        int puissance;
        char immatriculation[8];
        int annee_achat;  
        int type; // 0 = avion, 1 = hélicoptère
    } Avion;
""",
"""
    // Auteurs de science fiction 
    typedef struct asf {
        int nb_pages;
        char titre[128];
        char auteur[128];
        int annee_parution; 
        char editeur[128];
    } AuteurSF;
"""
]

proppcodechampchamp2 = [
("""Le camping car p est plus vieux ou a plus de places que q""", "(p->annee_achat < q.annee_achat || p->nb_places > q.nb_places)","annee_achat","nb_places"),

("""Le traité de philosophie p est plus vieux ou est plus long  que q""", "(p->annee_edition < q.annee_edition || p->nb_pages > q.nb_pages)","annee_edition","nb_pages"),

("""Le sous marin p est plus vieux ou est plus puissant que q""", "p->annee_achat < q.annee_achat || p->puissance > q.puissance ","annee_achat","puissance"),

("""L'avion p est plus vieux ou est plus puissant que q""", "(p->annee_achat < q.annee_achat ||   p->puissance > q.puissance)","annee_achat","puissance"),

("""Le livre de science fiction p est plus vieux ou est plus long que q""", "(p->annee_parution < q.annee_parution || p->nb_pages > q.nb_pages)","annee_parution","nb_pages"),
]
     
l = list(zip(structlist,proppcodechampchamp2, namelabels))

x = random.randint(0, len(l)-1)

struct, (propriete, pcode, champ, champ2),(structname,label) = l[x]


ff = f"""
#define STRUCTNAME {structname} 
{struct}
#define CHAMP {champ}
#define CHAMP2 {champ2}
#define PCODE {pcode}
""" 



PL:== */



/* PL:checks_args_stdin==
[["Test p > q ", ["a"], ""],
["Test p < q ", ["b"], ""],
["Test même premier champ >", ["c"], ""],
["Test même premier champ <", ["d"], ""],
]
PL:== */
