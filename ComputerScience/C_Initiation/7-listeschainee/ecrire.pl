


title= affiche liste
tag=affichage d'une liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `affiche `
qui affiche, sur une ligne, les éléments d'une liste chainée passée en parametre.  
On utilisera les types:  
typedef struct cel{
int val;
struct cel* suivant;
}Cellule;
typedef Cellulle* Liste  

==

editor.code==
....affiche(...) {
...
  /* votre code ici... */
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==
void affiche(Liste lst){
while(lst !=NULL){
    printf("%d ",lst->val);
    lst=lst->suivant;
    }
printf("\n");
}
==

codeafter
int main(void) {
	int n ;
    int somme=0;
    int nb=0;
    float moy;
    printf("Entrer une suite d'entiers positifs:\n");
    scanf("%d",&n);
    if(n<0) 
        printf("Suite vide.\n" );
    else{
        while (n>=0){
             somme+=n;
             nb+=1;
             scanf("%d",&n);
           }
        moy=somme;
        moy/=nb;
	    printf("somme=%d moyenne=%f diviseurs\n",somme,moy);
        }
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", "-1"],
  ["Grand", "", "100 1 2 3 4 5 6 7 8 9 10 -2"],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,10))])+" -1"]
  ]
==





