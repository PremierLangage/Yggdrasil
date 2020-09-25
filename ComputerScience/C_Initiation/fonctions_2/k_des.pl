title= lancé de k dés
tag=function


extends=/ComputerScience/C/template/stdsandboxC.pl


text==  
 
Ecrire une fonction 'lance_k_de' qui reçoit deux  entiers n et k renvoie
 le nombre de façon d'obtenir n avec k dés

**Exemple :**

lance_k_de(4,3) renvoie  3
 
 lance_k_de(4,4) renvoie  1
 
lance_k_de(40,3) renvoie  0
 
==
editor.code==
/*Type retour*/ lance_k_de(/*paramètre(s)*/) {
  /* votre code ici... */
  
}
==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==


int lance_k_de( int n,int k){
    int nb=0;
    int tout=0;
    int i;
    if (k<=0)
      return 0;
    if (k==1){
      if (0<n && n<7)
    	return 1;
      else
	    return 0;
    }
    for (i=1;i<=6;i++){
      nb=lance_k_de( n-i, k-1);  	
	  tout+=nb;    
    }                                 
                
    return tout;
}





==


codeafter==

int main(int argc, char const *argv[]) {
	int n = atoi(argv[1]);
int nb=0;
 int k=atoi(argv[2]);
 nb=lance_k_de(n,k);
  
	printf("%d façons d'obtenir  %d avec %d des \n",nb,n,k);
	return 0;
}
==


tests==
[ ["Basique", "5 2", ""],
  ["Vide", "0 3", ""],
  ["Grand", "20 5", ""],
   ["Aléatoire", ' '.join([str(random.randint(1, 24)), str(random.randint(1, 4))]), ""],
  ]
==







