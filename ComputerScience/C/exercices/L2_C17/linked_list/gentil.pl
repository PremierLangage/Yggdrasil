



text==
# Mots Méchants Mots Gentils.

Le Père Noël a besoin d'aide pour déterminer quelles chaînes de son fichier texte sont méchantes ou gentilles.

Une chaîne gentille est une chaîne avec toutes les propriétés suivantes :

     Il contient au moins trois voyelles (aeiou uniquement), comme aei, xazegov ou aeiouaeiouaeiou.
     Il contient au moins une lettre qui apparait deux fois de suite, comme xx, abcdde (dd) ou aabbccdd (aa, bb, cc ou dd).
     Il ne contient pas les chaînes ab, cd, pq ou xy, même si elles font partie de l'une des autres exigences.

Par example:

     ugknbfddgicrmopn est agréable car il a au moins trois voyelles (u...i...o...), une lettre double (...dd...), et aucune des sous-chaînes interdites.
     aaa est agréable car il a au moins trois voyelles et une lettre double, même si les lettres utilisées par différentes règles se chevauchent.
     jchzalrnumimmnmhp est méchant car il n`a pas de double lettre.
     haegwjzuvuyypxyu est méchant car il contient la chaîne xy.
     dvszwmarrgswjxmb est méchant car il ne contient qu`une seule voyelle. 

Ecrire une fonction question1(char *filename) qui lit dans le fichier filename et
 compte et retourne le nombre de chaines (une par ligne dans le fichier) gentilles.


Le fichier "gentil.test" contient 1000 chaines et le nombre de mots gentils est 253.

==



before==

# produire le fichier data 
import gentil

gentil.buildfile("data")


# calculer la solution pour ce fichier data
# crer un fichier 
# sol.c  contenant 
# int solution(char *name){ return solution; }
# compilation et création du fichier sol.o
# effasser le fichier sol.c 
# attention il faut ajouter sol.o dans les "flags" de compilation

==
