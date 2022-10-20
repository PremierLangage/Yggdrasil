
extends= DMexo3.pl

title = DM - struct - victoire 


text==#|markdown|
Écrire une function **victoire_g** qui prend  

- l'adresse d'un jeu. 
et qui retourne si oui ou non c'est une victoire.

La condition de victoire est:  
- soit il y a autant de drapeaux que de mines et que les drapeaux sont bien placés.  
- soit toutes les cases sans mines sont découvertes (et les mines ne sont pas découverte).  

Attention le test est un peu long.
==

solution==


int victoire_t(int **t, int H, int L, int M){
int nb=0;
int bad=0;
int nm=0;
for(int i=0; i < H; i++)
    for(int j=0; j< L; j++)
    {
        if (t[i][j]==-9) nb++;
        if (t[i][j]==-10) bad++;
        if (t[i][j]==0) nm++;
    }

if (((nb == M)||(nm==0)) && bad ==0) return 1;
return 0;
}
int victoire_g(Game *g){
    return victoire_t(g->t, g->H, g->L, g->M);
}

==