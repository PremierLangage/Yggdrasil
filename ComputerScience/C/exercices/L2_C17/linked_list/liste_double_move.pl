extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Henri Derycke

title=Déplacement d'une liste doublement chainée à une autre

tag=Liste|Pointeur


text==#|markdown|

    typedef struct _maillon {
        int valeur;
        struct _maillon ∗suiv, ∗prev;
    } Maillon , ∗ Liste;

On souhaite écrire une fonction `void move(Liste *source, Liste *cible);` qui déplace le maillon 
de la liste pointé par source devant le maillon pointé par cible.
Le pointeur `*source` pointe alors sur l'élément suivant s'il existe, et `*cible` pointe sur le maillon déplacé (en cas de succès).

Par exemple:

    L1 -> 1  0  10 
    L2 -> 6  8 

    Après move(&L1, &L2)
    L1 -> 0  10 
    L2 -> 1  6  8

    Après move(&(L2->suiv), &(L1->suiv))
    L1 -> 0 6 10
    L2 -> 1 8

Écrire le code de la fonction **move**.

Attention : Vous devrez gérer le cas où source pointe sur un pointeur `NULL` en ne faisant rien.

== 

editor.code==
typedef struct _maillon {
    int valeur;
    struct _maillon *suiv, *prev;
} Maillon , *Liste;

void move(Liste *source, Liste *cible) {
   /* votre code ici... */
}

==
solution==
typedef struct _maillon {
    int valeur;
    struct _maillon *suiv, *prev;
} Maillon , *Liste;

void move(Liste *source, Liste *cible) {
    Maillon *to_move = *source;
    Maillon *dest = *cible;

    // rien à bouger
    if (to_move == NULL) return;

    // cas dégénérés en cas de liste commune, ptete à exclure du sujet ?
    if (to_move == dest) return; 
    if (dest != NULL && to_move == dest->prev) return; // rien à faire

    // on déconnecte to_move de sa liste doublement chainée
    if (to_move->prev) to_move->prev->suiv = to_move->suiv;
    if (to_move->suiv) to_move->suiv->prev = to_move->prev;
    
    // facultatif ? non
    *source = to_move->suiv; 
    *cible = to_move;

    if (dest == NULL) {
        return;
    }
    to_move->suiv = dest;
    to_move->prev = dest->prev;
    dest->prev = to_move;
    if (to_move->prev != NULL) to_move->prev->suiv = to_move;
}

==

code_before==

#include <stdlib.h>
#include <stdio.h>

==

code_after==#|c|

Maillon* alloue_maillon(int x){
    Maillon *tmp = NULL;
    if((tmp = malloc(sizeof(Maillon))) != NULL) {
        tmp->valeur = x;
        tmp->suiv = NULL;
        tmp->prev = NULL;
    }
    return tmp;
}

Liste lire(){
    Liste tmp = NULL;
    int x;
    while(scanf("%d", &x) == 1) {
        if (x < 0) break;
        if(tmp == NULL) {
            tmp = alloue_maillon(x);
        } else {
            tmp->prev = alloue_maillon(x);
            tmp->prev->suiv = tmp;
            tmp = tmp->prev;
        }
    }
    return tmp;
}

void affiche(Liste l, Maillon *m1, Maillon *m2) {
    for (; l != NULL; l = l->suiv) {
        if (l == m1 || l == m2) printf(" [%d] ", l->valeur);
        else printf(" %d ", l->valeur);
    }
    printf("\n");
}

int main(void) {
    Liste l1 = lire();
    Liste l2 = lire();

    int i1, i2;
    if (scanf("%d%d", &i1, &i2) != 2)
        return 1;

    Maillon *m1 = l1;
    for (int i = 0; i < i1; i++)
        m1 = m1->suiv;
    Maillon *m2 = l2;
    for (int i = 0; i < i2; i++)
        m2 = m2->suiv;

    Maillon *s1 = m1;
    Maillon *s2 = m2;

    Liste *p1 = m1 == l1 ? &l1 : &m1;
    Liste *p2 = m2 == l2 ? &l2 : &m2;

    printf("Avant:\n");
    printf("L1:");
    affiche(l1, s1, s2);
    printf("L2:");
    affiche(l2, s1, s2);

    move(p1, p2);
    
    printf("Après move:\n");
    printf("L1:");
    affiche(l1, s1, s2);
    printf("L2:");
    affiche(l2, s1, s2);
    
	return 0;
}
==


checks_args_stdin==#|python|
[
    ["Basique: premier maillon vers premier maillon", "", "10 0 1 -1 8 6 -1 0 0"],
    ["Basique: autre vers premier maillon", "", "10 0 1 -1 8 6 -1 1 0"],
    ["Vide 1", "", "-1 1 -1 0 0"],
    ["Vide 2", "", "1 -1 -1 0 0"],
    ["Aléatoire 1", "", (lambda l1,l2: 
            " ".join([str(randint(0,100)) for i in range(l1)]) + " -1 "
            + " ".join([str(randint(0,100)) for i in range(l2)]) + " -1 "
            + "0"
            + " "
            + str(randint(1,l2-1))
        )(randint(5,20),randint(5,20))],
    ["Aléatoire 2", "", (lambda l1,l2: 
            " ".join([str(randint(0,100)) for i in range(l1)]) + " -1 "
            + " ".join([str(randint(0,100)) for i in range(l2)]) + " -1 "
            + str(randint(1,l1-1))
            + " "
            + "0"
        )(randint(5,20),randint(5,20))],
    ["Aléatoire 3", "", (lambda l1,l2: 
            " ".join([str(randint(0,100)) for i in range(l1)]) + " -1 "
            + " ".join([str(randint(0,100)) for i in range(l2)]) + " -1 "
            + str(randint(1,l1-1))
            + " "
            + str(randint(1,l2-1))
        )(randint(5,20),randint(5,20))],
    ["Aléatoire 4", "", (lambda l1,l2: 
            " ".join([str(randint(0,100)) for i in range(l1)]) + " -1 "
            + " ".join([str(randint(0,100)) for i in range(l2)]) + " -1 "
            + str(randint(1,l1-1))
            + " "
            + str(randint(1,l2-1))
        )(randint(5,100),randint(5,100))],
    ["Aléatoire 5", "", (lambda l1,l2: 
            " ".join([str(randint(0,100)) for i in range(l1)]) + " -1 "
            + " ".join([str(randint(0,100)) for i in range(l2)]) + " -1 "
            + str(randint(1,l1-1))
            + " "
            + str(randint(1,l2-1))
        )(randint(5,100),randint(5,100))]
]
==
