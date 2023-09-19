

/* PL:title="Analyse d'une suite d'entiers." */
/* PL:text==

Ecrire une fonction **exo** qui ne prend pas de paramètre et ne renvoie rien.


Votre fonction **exo** doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Puis doit afficher le nombre d'élèments de la plus grande section constante (la même valeur) par exemple 0 si il sont tous différents.
Puis doit afficher le nombre d'élèments de la plus grande section croissante (la même valeur) par exemple 0 si la suite est purement décroissante ou constante.

Exemple:   
3 3 12 -1   
affichera  
Plus longue partie constante 1
Plus longue partie croissante 2



Affiche "vide" si le premier élément est négatif ou nul.

PL:== */


// PL:code_before==
#include <stdio.h>



// PL:==
// PL:solution==

void exo(){
    int n;
    int l;
    int lsc=0;
    int lds=0;
    int nlds=0;
    int nlsc=0;
    scanf("%d",&l);
    if (l <0){
        printf("vide\n");
        return;
    }
    while (scanf("%d",&n)==1 && n>0)
    {
        if (n > l){
            nlsc += 1;
            if (nlsc>lsc){
                lsc=nlsc;
            }                
        } else nlsc = 0; 
        if (n == l){
            nlds += 1;
            if (nlds>lds){
                lds=nlds;
            }
        }  else nlds = 0; 
        l=n;
    }
printf("Plus longue partie constante %d\n",lds);
printf("Plus longue partie croissante %d\n",lsc);

}

// PL:==

/* PL:code==
void exo(){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// PL:code_after==

int main(){
    exo();
    return 0;
}


// PL:==

/* PL:checks_args_stdin==
[["test de l'ennonce ",[],"3 3 12 -1 "],
["Test  croissant ", [], "3 4 5 6 7 7 67 88 263 -2"],
["Test Décroissant ", [], "263 134 121 111 98 87 65 43 21 -2"],
["Test un plateau", [], "263 134 121 111 111 111 111 111 98 87 65 43 21 -2"],
]
PL:== */