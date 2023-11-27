






// PL:author=DR

// PL:title= Liste chainées Insertion triée
/* PL:text==

Voici la structure de liste suivante:

    {struct}

on nous demande d'ecrire la fonction de **{structname} insertion({structname}  tete, int valeur) ** 
qui prend en paramètre un pointeur sur le premier élément de la liste et un entier 
ajoute un élément dans la liste de manière à ce que la liste reste triée (croissante)
et qui retourne un pointeur sur le premier élément de la liste.

La liste pointe initialement sur NULL.

PL:== */


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

#ifndef STRUCTNAME

typedef struct _ {
    int valeur;
    struct _ *NEXT;
} *Truc;
#define STRUCTNAME Truc
#endif
// PL:==
// PL:solution==

// STRUCTNAME XXX(STRUCTNAME *p, int valeur){
//     if (*p == NULL ){
//     STRUCTNAME q = malloc(sizeof(**p));
//     q->valeur = valeur;
//     *p=q;
//     return q;
//     }
//     STRUCTNAME first = *p;
//     while (*p != NULL && (*p)->valeur < valeur)
//         p = &((*p)->NEXT);
//     STRUCTNAME *q = malloc(sizeof(*p));
//     q->valeur = valeur;
//     q->NEXT = *p;
//     return first;
// }

STRUCTNAME alloc(int valeur){
    STRUCTNAME q = malloc(sizeof(*q));
    q->valeur = valeur;
    q->NEXT = NULL;
    return q;
}

// insertion triée dans liste chainée
STRUCTNAME insertion(STRUCTNAME p, int valeur){
    if (p == NULL ){ // liste vide
        return alloc(valeur);
    }
    if (p->valeur > valeur){ // insertion en tête
        STRUCTNAME q = alloc(valeur);
        q->NEXT = p;
        return q;
    }
    STRUCTNAME first = p;
    while (p->NEXT != NULL && p->NEXT->valeur < valeur)
        p = p->NEXT;
    STRUCTNAME q = alloc(valeur);
    q->NEXT = p->NEXT;
    p->NEXT = q;
    return first;
}


// PL:==

/* PL:code==
int test(STRUCTNAME *p,int taille)



PL:== */

// PL:code_after==

void afficheListe(STRUCTNAME p){
    while (p){
        printf("%d ",p->valeur);
        p = p->NEXT;
    }
}


int main(int argc, char **argv)
{
    int n;
    int i=0;
    STRUCTNAME p = NULL;

    while (scanf("%d",&n) == 1)
    {
        p = insertion(p,n);
        if (i++ < 20)  {afficheListe(p);
        printf("\n");}
    }
    afficheListe(p);
    printf("\n");
}


// PL:==
/* PL:aleacode==


import random


structlist = [
"""
    typedef struct liste {
        int valeur;
        struct liste *suivant;
    } *Liste;
""",
"""
    typedef struct tp {
        int valeur;
        struct tp *next;
    } *List;
""",
"""

    typedef struct sm {
        int valeur;
        struct sm *suiv;
    } *ListeChainee;
""",
"""
    typedef struct av {
        int valeur;
        struct av *next;
    } *Chaine;
""",

"""
    typedef struct asf {
        int val;
        struct asf *next;
    } *Liste;
"""
]
namelabels=[("Liste","suivant"),("List","next"),("ListeChainee","suiv"),("Chaine","next"),("Liste","next")]


l = list(zip(structlist, namelabels))

if 'number' in globals():
    x=int(number)
else:
    x = random.randint(0, len(l)-1)

struct, (structname,next) = l[x]


ff = f"""
#define STRUCTNAME {structname} 
{struct}
#define NEXT  {next}
""" 



PL:== */



/* PL:checks_args_stdin==
[["Test 1 ", ["1"], "1 2 3 4 5 6  7 8 9 10 11 12 13 14 15 16 17 18 19 20"],
["Test 2 ", ["2"], "30 29 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5  4 3 2 1"],
["Test 3 ", ["3"], "598 533 478 941 756 556 771 280 344 207 957 351 394 561 120 436 183 392 683 857 237 802 330 666 755 349 580 816 985 916 518 646 864 356 704 703 696 485 634 145 863 673 172 731 477 624 179 168 762 624 699 166 720 847 838 250 489 643 450 658 599 891 726 279 158 752 398 445 966 349 139 646 217 646 390 884 290 983 501 876 611 646 510 111 745 733 602 679 357 813 596 411 772 681 426 693 931 729 149 594 868 661 218 433 459 637 137 456 463 260 390 295 202 306 742 820 431 783 695 577 345 356 640 694 720 954 739 432 137 586 884 316 452 765 796 536 399 975 301 435 845 337 213 871 211 859 233 868 713 778 559 713 118 326 197 959 136 318 402 710 918 812 947 710 546 283 393 259 344 580 737 550 154 941 962 359 446 610 846 292 118 279 638 680 779 339 958 391 441 178 954 188 249 766 397 796 145 324 815 345 761 914 611 500 638 329 212 271 386 430 487 727 202 533 722 295 948 362 194 716 732 309 228 777 726 493 817 228 948 714 298 814 923 708 603 546 590 141 804 607 600 459 359 478 193 750 499 251 749 566 505 354 236 852 571 436 902 933 167 204 474 916 289 708 508 681 714 795 209 527 935 197 742 179 112 568 396 405 726 282 889 677 713 422 612 527 469 662 262 647 278 858 192 482 928 275 308 510 423 436"],
["Test 4 ", ["4"], "26 47 98 49 63 39 24 39 37 88 25 49 96 38 30 73 22 87 40 33 36 66 90 70 61 95 66 89 62 29"],
]
PL:== */
