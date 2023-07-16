
extends= /template/java.pl

title= Sorties

text==

On veut produire quelque chose avec notre code !

Afficher un text sur l'ecran ! 

Techniquement on dit "envoyer des caractères sur la sortie standard" !

Pour cela on utilise la fonction **println** de la class **java.lang.System**.

Dans la fonction Main de la class Bienvenue ajoutez la ligne suivante :

    System.println("Hello");

==

classname = Bienvenue
stdout_tests==
"No argument" Hello
James "Hello James" Hello
==