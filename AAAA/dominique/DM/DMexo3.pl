
extends=DMexo1.pl




title= DM - Print terrain 
tag=DM

text==#|markdown|
Écrire une function **play_t** qui prend  

- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)  
- un entier representant la hauteur du terrain  
- un entier la largeur  
- un entier i  
- un entier j  
et qui retourne le nombre de mines sur les 8 cases adjacentes de la case de coordonées i,j
avec le terrain suivant on a  
nbmines(...,0,1)-> 1  
nbmines(...,1,1)-> 2  
nbmines(...,2,2)-> 1  
nbmines(...,0,2)-> 1 ne pas compter la mine en 0,2


    0 0 9 9 0 9 0 0 0 0 
    0 2 0 3 0 0 0 0 0 0 
    0 1 9 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 9 9 
    0 0 0 0 0 0 0 0 9 0 
    0 0 0 0 0 0 0 0 0 0 

rappel: on réalise un https://fr.wikipedia.org/wiki/D%C3%A9mineur_(genre_de_jeu_vid%C3%A9o)
==