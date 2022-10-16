
extends=DMexo1.pl




title= Test de fin de partie 


text== 

Quand le nombre de drapeau est égale au nombre de mines. 
Et que les drapeaux sont biens placés le joueur à gagné !

La fonction **victoire** prend en parametre :
- la grille  
- un entier avec le nombre de mines
- deux entiers représentant les dimensions de la grille  

et retourne 
oui(1) si la grille contient une configuration de victoire,  
si par contre le nombre de drapeaux est égal aux nombre de mines mais qu'un drapeau est mal placé retourne (-1) BOOM !!  
sinon retourne 0 dans les autres cas.

==


editor.code==
int victoire(int **t,int m, int h, int l){


}
==

solution==
int nbdrapeaux(int h, int l, int **t){

return n;
}   

int victoire(int **t,int m, int h, int l){
    int n=0;
    int bad=0;
    for(int i=0; i < h; i++)
        for(int j=0; j <l ; j++){
            if (t[i][j]== -9 )
                n++; 
            if ( t[i][j]== -10)
                {n++; bad++; }
    if (n != m) return 0;
    if (bad) return -1;
    return 1;

}
==



code_after==


==



astuces==#|python|
[]
==
