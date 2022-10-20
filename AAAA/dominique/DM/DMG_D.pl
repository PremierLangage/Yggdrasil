
extends= DMexoD.pl



author=Julien Roupin & DR

title= DM - struct - Drapeau
tag=DM

text==#|markdown|
Écrire une function **Drapeau_g** qui prend

- une structure Game en paramêtre
- deux entiers représentant les coordonées du choix de la casr   


et ajoute un drapeau aux coordonées choisient si la case est non découverte, enlève le drapeau si il y a un drapeau, et ne fait rien si la case est découverte.   

Pour rappel, le code est le suivant :

  - Si une case est pas découverte :
    - 9 si il y a une mine   
    - -9 si il y a une mine et un drapeau  
    - -10 si il y a un drapeau  
    - 0 sinon  
  - Si une case est découverte:  
    - 1 à 8 le nombre de mines autour de la case  
    - -11 pour 0 mines   


==

editor.code==


==