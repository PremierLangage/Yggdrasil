

/* PL:title= Analyse d'une suite d'entiers. */
/* PL:text==

Ecrire une fonction **suite** qui ne prend pas de paramètre et ne renvoie rien.


Votre fonction **suite** doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Elle affichera "Vide" si le premier élément saisie est négatif ou nul et s'arrêtera à ce stade.

Sinon, elle affichera ensuite la longueur de la plus grande section constante (*i.e.* 0 si il sont tous différents, 
1 si elle contient au plus deux éléments consécutifs sont égaux, etc.)

Enfin, elle affichera la longueur de la plus longue section croissante (*i.e.* 0 si la suite est purement
décroissante ou constante, 1 s'il y a exactement au plus deux éléments rangés par ordre croissants, etc.)
Ici, les inégalités seront prises au sens large.

<br />

**Exemple 1 :**   
La saisie de 3 3 12 -1 affichera :  <br />
Plus longue partie constante : 1    <br />
Plus longue partie croissante : 2   <br />

<br />

**Exemple 2 :**   
La saisie de 1 3 12 -1 affichera :  <br />
Plus longue partie constante : 0    <br />
Plus longue partie croissante : 2   <br />
PL:== */


// PL:code_before==
#include <stdio.h>



// PL:==
// PL:solution==

void suite(){
    int n;
    int l;
    int lsc=0;
    int lds=0;
    int nlds=0;
    int nlsc=0;
    scanf("%d",&l);
    if (l <0){
        printf("Vide\n");
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
printf("Plus longue partie constante : %d\n",lds);
printf("Plus longue partie croissante : %d\n",lsc);

}

// PL:==

/* PL:code==
void suite(){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// PL:code_after==

int main(){
    suite();
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