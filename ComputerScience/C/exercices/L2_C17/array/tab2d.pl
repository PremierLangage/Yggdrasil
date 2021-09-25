title=Tableau 2d de caractères

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==
Ecrire une fonction de protopype `void remplit(char tab[MAX][MAX],int li,int col)` 
qui remplit la partie effective avec des lettres minuscules consécutives.<br>
Après la lettre $%\tt{z}%$ on repart de la lettre $%\tt{a}%$ <br>
Exemples (avec MAX 50)<br>
remplit(tab,3,4) transforme les 3 premières lignes et 4 premières colonnes en<br>
abcd<br>
efgh<br>
ijkl<br>
remplit(tab,4,10) transforme les 4 premières lignes et 10 premières colonnes en<br>
abcdefghij<br>
klmnopqrst<br>
uvwxyzabcd<br>
efghijklmn<br>
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

#define MAX 50

==

editor.code==
void remplit(char tab[][MAX],int li,int col){

}
==
solution==
void remplit(char tab[MAX][MAX],int li,int col){
  char l='a';
  int d=0;
  int i,j;
  for(i= 0;i<li;i++)
    for(j=0;j<col;j++){
      tab[i][j]=l;
      d=(d+1)%26;
      l='a'+d;
    }
}
==
codeafter==
void affiche (char tab[][MAX],int li,int col){
  int i,j;
  for(i= 0;i<li;i++){
    for(j=0;j<col;j++)
      printf("%c",tab[i][j]);
    printf("\n");
    }
}

int main(void){
  char tab[MAX][MAX];
  int li,col;
  scanf("%d %d",&li,&col);
  remplit(tab,li,col);
  affiche(tab,li,col);
  return 0;
}

==


tests==
[ ["simple éxécution", "","3 4"],
["aléatoire ", "",str(random.randint(4,8))+" "+str(random.randint(9,15))],
]
==



