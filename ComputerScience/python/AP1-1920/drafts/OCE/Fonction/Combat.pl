
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Conception d'un jeu de rôle

code==
n= int(input("Entrez un nombre : "))



print("avec(1)",??,"avec(2)",??)

==

text==  
Dans cet exercice VOUS êtes un concepteur de jeu de rôle.<br>

Ce qu'on vous demande ici est de programmer la partie "combat". <br>
Ce sont en effet des choses qui arrivent quand vous rencontrez un enemi avec lequel il est impossible de discuter ! <br>
<br>
Ecrivez une fonction "combat" qui reçoit en paramétre les "endurances" et les "habilités" des deux protagonistes et organise le combat de la manière suivante :<br>
<br>
1 en fonction de leur habilité, les deux adversaires lancent les dés :<br>
* 1 dés pour une habilité inférieur ou égale à 10 <br>
* 2 dés pour une habilité supérieure 10 et inférieur stricte à 18 <br>
* 3 dés 3 au delà d'une habilité de 17 <br>
2 on compare le résultat, <br>
3 la différence des deux lancés est soustrait au points d'endurance de l'adversaire dont le lancé est inférieur, <br>
4 en cas d'égalité on recommence les lancez de dés, <br>
5 quand l'un des deux adversaires voit son endurance réduite à 0 la fonction retourne les deux endurances.<br> 
<br>
<br>
Vous écrirez ensuite un programme qui fera les actions suivantes : <br>
1 créer deux adversaires d'endurance aléatoire <br>
2 appeler la fonction combat <br>
3 récupérer le résultat de la fonction <br>
4 afficher le vainceur <br>





==
soluce==

==
plsoluce==

==




