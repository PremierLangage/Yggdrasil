
extends= /template/java.pl

title= Causer à l'utilisateur 

text==

On veut produire quelque chose avec notre code !

Afficher un text sur l'ecran ! 

Techniquement on dit "envoyer des caractères sur la sortie standard" !

Pour cela on utilise la fonction **println** de la class **java.lang.System**.

Dans la fonction Main de la class Bienvenue ajoutez la ligne suivante :

    System.out.println("Hello");

L'idée est que System.out est un canal de sortie de votre programme et que vous écrivez dedans en utilisant sa méthode println.

La méthode println recopie ses paramètre dans le canal et ajoute un caractère de fin de ligne '\n'.
==

classname = Bienvenue
stdout_tests==
"No argument" Hello
James "Hello James" Hello
==