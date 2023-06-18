extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Henri Derycke

title=Déplacement d'une liste doublement chainée à une autre

tag=Liste|Pointeur


text==#|markdown|

    typedef struct _maillon {
        int valeur;
        struct _maillon ∗suiv, ∗prec;
    } Maillon , ∗ Liste;

On souhaite écrire une fonction `void move(Liste *source, Liste *cible);` qui déplace le premier
maillon de la liste pointé par source devant le maillon pointé par cible.

Écrire le code de la fonction **move**.

Attention : Vous devrez gérer le cas où source pointe sur un pointeur `NULL` en ne faisant rien.

== 

editor.code==
typedef struct _maillon {
    int valeur;
    struct _maillon *suiv, *prec;
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

    if (to_move == NULL) return;
    if (to_move == dest) return; // ptete à exclure du sujet

    // on déconnecte to_move de sa liste doublement chainée
    if (to_move->prev) to_move->prev->suiv = to_move->suiv;
    if (to_move->suiv) to_move->suiv->prev = to_move->prev;
    
    // facultatif ?
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
        tmp->value = x;
        tmp->suiv = NULL;
        tmp->prec = NULL;
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

void affiche(Liste l) {
    for (; l != NULL; l = l->suiv) {
        printf("%d ", l->valeur);
    }
    printf("\n");
}

int main(void) {
	Liste l1 = lire();
	Liste l2 = lire();

    printf("Avant:\n");
    affiche(l1);
    affiche(l2);

    move(&l1, &l2);

    printf("Après:\n");
    affiche(l1);
    affiche(l2);
    
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", ""],
    ["Aléatoire 1", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20))])+" -1"],

  ["Aléatoire 2", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,100))])+" -1"]
  ]
==










