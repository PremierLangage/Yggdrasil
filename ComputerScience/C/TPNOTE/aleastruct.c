




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



int main(int argc, char **v){
    STRUCTNAME p,q;
    init(&p,12,2018);
    init(&q,18,2018);
    printf("Test 1 %s\n", test(&p,q)? "True":"False");
    init(&p,18,2018);
    init(&q,11,2018);
    printf("Test 2 %s\n", test(&p,q)? "True":"False");
    init(&p,11,2018);
    init(&q,11,2019);
    printf("Test egal %s\n", test(&p,q)? "True":"False");
    init(&p,11,2019);
    init(&q,11,2018);
    printf("Test egal %s\n", test(&p,q)? "True":"False");
    return 0;
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
        int annee_parution; // AAAA
        char editeur[128];
    } TraitePhilosophique;
""",
"""
    // Sous marin
    typedef struct sm {
        int nb_torpilles;
        int puissance;
        char immatriculation[8];
        int annee_achat; // AAAA
        int propulsion; // 0 = diesel, 1 = nucléaire
    } SousMarin;
""",
"""
    // Avions
    typedef struct av {
        int nb_places;
        int puissance;
        char immatriculation[8];
        int annee_achat; // AAAA
        int type; // 0 = avion, 1 = hélicoptère
    } Avion;
""",

"""
    // Auteurs de sciencefiction 
    typedef struct asf {
        int nb_pages;
        char titre[128];
        char auteur[128];
        int annee_parution; // AAAA
        char editeur[128];
    } AuteurSF;
"""
]

proppcodechampchamp2 = [
("""Le camping car est plus vieux et avec plus de places""", "p->annee_achat < q.annee_achat || (p->annee_achat == q.annee_achat && p->nb_places > q.nb_places)","nb_places","annee_achat"),

("""Le livre de science fiction est plus vieux et plus long""", "p->annee_parution < q.annee_parution || (p->annee_parution == q.annee_parution && p->nb_pages > q.nb_pages)","nb_pages","annee_parution"),

("""Le sous marin est plus vieux et plus puissant""", "p->annee_achat < q.annee_achat || (p->annee_achat == q.annee_achat && p->puissance > q.puissance)","puissance","annee_achat"),

("""L'avion est plus vieux et plus puissant""", "p->annee_achat < q.annee_achat || (p->annee_achat == q.annee_achat && p->puissance > q.puissance)","puissance","annee_achat"),

("""Le traité de philosophie est plus vieux et plus long """, "p->annee_parution < q.annee_parution || (p->annee_parution == q.annee_parution && p->nb_pages > q.nb_pages)","nb_pages","annee_parution"),
]
     
l = list(zip(structlist,proppcodechampchamp2, namelabels))

x = random.randint(0, len(l)-1)

for i,(struct, (propriete, pcode, champ, champ2),(structname,label)) in enumerate(l):
    if i==x:
        break


ff = f"""
#define STRUCTNAME {structname} 
{struct}
#define CHAMP {champ}
#define CHAMP2 {champ2}
#define PCODE {pcode}
""" 





PL:== */



/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */
