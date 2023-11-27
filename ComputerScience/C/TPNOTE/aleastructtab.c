





// PL:author=DR

// PL:title= Test sur un tableau de structures
/* PL:text==

Voici la structure suivante:

    {struct}

on nous demande d'ecrire la fonction de **test** qui prend en paramêtre un tableau de {structname} qui calcul et retourne la valeur suivante: 

    {propriete}

Vous placerez le pointeur avant la taille dans les paramètres de la fonction.



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

int test(STRUCTNAME *p,int taille)

PCODE


// PL:==

/* PL:code==
int test(STRUCTNAME *p,int taille)



PL:== */

// PL:code_after==

void init(STRUCTNAME *z, int x, int y)
{
    z->CHAMP = x;
    z->CHAMP2 = y;
}



int main(int argc, char **argv)
{
    STRUCTNAME *p;
    srand(atoi(argv[1]));
    int taille=rand()%10+100;
    p = malloc(taille*sizeof(STRUCTNAME));
    for(int i=0;i< taille; i++)
        init(p+i,1000+rand()%1000,rand()%2+(rand()%100)*10);

    printf("Calcul de la propriété %d\n",test(p,taille));
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
        int type ; // % 2 ==0 : diesel, % 2 == 1 : essence 
    } CampingCar;
""",
"""
    // traité de phylosophie 
    typedef struct tp {
        int nb_pages;
        char titre[128];
        char auteur[128];
        int annee_edition;  
        int type ; // %2 == 0 : poche, %2 == 1 :broché
    } TraitePhilosophique;
""",
"""
    // Sous marin
    typedef struct sm {
        int nb_torpilles;
        int puissance;
        char immatriculation[8];
        int annee_achat;  
        int propulsion; // % 2 ==0 : diesel, % 2 == 1 :nucléaire
    } SousMarin;
""",
"""
    // Avions
    typedef struct av {
        int nb_places;
        int puissance;
        char immatriculation[8];
        int annee_achat;  
        int type; // % 2 ==0 : avion, % 2 == 1 :hélicoptère
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
        int type ; // % 2 ==0 : roman, % 2 == 1 :nouvelle
    } AuteurSF;
"""
]

proppcode  = [
("""   Somme totale des places des CampingCar
     ayant une puissance > à 200 """, """
{int sum=0;
for(int i=0;i< taille; i++)
    if (p[i].puissance > 200)
        sum += p[i].nb_places;
return sum;
}
""", "nb_places","puissance"),

("""   Nombre total de pages dans les TraitePhilosophique 
    ayant une année d'édition > 2018 """, """
{int sum=0;
for(int i=0;i< taille; i++)
    if (p[i].annee_edition > 2018)
        sum += p[i].nb_pages;
return sum;}
""", "nb_pages","annee_edition"),

("""   L'indice dans le tableau du SousMarin
     avec le plus grand nombre de torpiles""", """
{int indice = 0; int max = p[0].nb_torpilles;
for(int i=1;i< taille; i++)
        if (p[i].nb_torpilles > max){
            max = p[i].nb_torpilles;
            indice = i;
        }
return indice;}
""", "nb_torpilles","puissance"),

("""   Nombre de place total dans les Hélicoptères du tableau.""", """{
int sum = 0;
for(int i=0;i< taille; i++)
    if (p[i].type % 2 == 1)
        sum += p[i].nb_places;
return sum;
}
""", "nb_places","type"),

("""   Nombre de pages total des nouvelles (pas des romans).""", """{
int sum = 0;
for(int i=0;i< taille; i++)
    if (p[i].type % 2 == 1)
        sum += p[i].nb_pages;
return sum;
}
""", "nb_pages","type"),
]
     
l = list(zip(structlist,proppcode, namelabels))

if 'number' in globals():
    x=int(number)
else:
    x = random.randint(0, len(l)-1)

struct, (propriete, pcode, champ, champ2),(structname,label) = l[x]

pcode = " ".join(pcode.split('\n'))

ff = f"""
#define STRUCTNAME {structname} 
{struct}
#define CHAMP {champ}
#define CHAMP2 {champ2}
#define PCODE {pcode}
""" 



PL:== */



/* PL:checks_args_stdin==
[["Test 1 ", ["1"], ""],
["Test 2 ", ["2"], ""],
["Test 3 ", ["3"], ""],
["Test 4 ", ["4"], ""],
]
PL:== */
