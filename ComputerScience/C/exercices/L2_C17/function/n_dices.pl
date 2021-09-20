#*****************************************************************************
#  Copyright (C) 2019 Marc Zipstein
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Marc Zipstein

title=Lancé de n dés

tag=fonction|declaration|parametre

text==#|markdown|

Écrire une fonction `lance_n_des` qui reçoit deux entiers `val` et `n` et renvoie
le nombre de façon d'obtenir `val` en faisant la somme des valeurs d'un lancé de 
`n` dés (à 6 faces)

<b><u>Exemple :</u></b>

`lance_n_des(4, 3)` renvoie `3` car (3 = 2+1+1 ou 3 = 1+2+1 ou 3 = 1+1+2)   
`lance_n_des(4, 4)` renvoie `1` (4 = 1+1+1+1)   
`lance_n_des(40, 3)` renvoie `0` (max : 6+6+6 = 18 < 40)   
 
==
editor.code==
/*Type retour*/ lance_k_de(/*type */ n, /*type*/ k) {
  /* votre code ici... */

}
==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==


int lance_k_de(int n,int k){
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
[ 
  ["Exemple énoncé1", "4 3", ""],
  ["Exemple énoncé2", "4 4", ""],
  ["Exemple énoncé3", "40 3", ""],
  ["Basique", "5 2", ""],
  ["Vide", "0 3", ""],
  ["Grand", "20 5", ""],
   ["Aléatoire", ' '.join([str(random.randint(1, 24)), str(random.randint(1, 4))]), ""],
  ]
==













