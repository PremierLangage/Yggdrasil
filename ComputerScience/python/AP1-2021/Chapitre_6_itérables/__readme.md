# Document - Itérables

Liste des exercices sur les itérables (liste, tuple, string, fichier), avec description simple, les tags et les changements éventuels.

Les exercices sont listé **en ordre ASCII** pour leur nom de fichier. Pour ajouter un exercice au milieu, veuillez utiliser le format ``Ex7c`` pour un reménagement éventuel.

Le nombre du fichier d'un exercice doit être une description biève de son contenu.

Les tags sont séparés par |

Liste des tags : input | split | substring | algo | stringRepeat | ForIn | stringIndex | find | immutable | ForIn | stringConcat | mutable | tuple | file | listoflist

En charge : **Wenjie Fang**

# Ex1 : Lire une liste (parser une liste séparée pas les espaces)

@ lireuneliste-2021.pl

tag = input | split

**Commentaires**

- Bugfix : il roule maintenant sur plsoluce, pas inputgenerator
- Tags ajoutés

# Ex2 : Répétition au début (trouver le préfixe qui se répète le plus)

@ head-repeat-2021.pl

tag = substring | algo | stringRepeat

**Commentaires**

- Exercice difficile avec des cas limits

# Ex3 : Compter les lettres "e"

@ compter-e-2021.pl

tag = ForIn | stringIndex

**Commentaires**

- Exercice facile pour compter les lettres "e"
- Tags ajoutés

# Ex4 : Trouver tous les occurrences

@ str-occu-2021.pl

tag = find | algo

**Commentaires**

- Exercice moyenne-difficile pour rechercher tous les occurrences d'une sous-chaîne

# Ex5 : Rotation de chaîne de caractères

@ str-rotate-2021.pl

tag = substring

**Commentaires**

- Exercice un peu astucieux pour faire la rotation

# Ex6 : Remplacer les k par g

@ remplace-k-par-g-2021.pl

tag = immutable | ForIn | stringConcat

**Commentaires**

- Exercice pour parcourir et remplacer les caractères dans une chaîne.
- Notion d'objet non mutable, sinon une solution simple est de faire un parcours et changer les lettres directement.

# Ex7 : Corriger les tuples saisis

@ corriger-tuple-2021.pl

tag = mutable | immutable | ForIn | tuple

**Commentaires**

- Exercice compliqué pour remplacer des occurrences selon un dictionnaire
- La difficulté consiste de la différence entre tuple et liste.
- En tout cas assez compliqué conceptuellement et aussi sur le code.

# Ex8 : Compter les lignes

@ wcl-2021.pl

tag = file | ForIn

**Commentaires**

- Exercice simple pour entraîner la lecture de fichier

# Ex9 : Lire les premiers lignes

@ head-2021.pl

tag = file | ForIn | break

**Commentaires**

- Exercice simple qui simule la fonctionalité de la commande head en linux, mais seulement 5 lignes.

# Ex10 : Recherche de motif dans un fichier

@ grep-2021.pl

tag = file | ForIn | substring

**Commentaires**

- Exercice simple qui simule la fonctionalité de la commande grep en linux

# Ex11 : Progression arithmétique, mais sans boucle

@ progression-arithmetique-2021.pl

tag = range

**Commentaires**

- Exercice pour l'utilisation de range. La seule difficulté est le cas où la raison est 0.
















--------------------------------


# ExA : Lire une matrice

@ ~matrix-file-2021.pl

tag = file | listoflist | split | ForIn

**Commentaires**

- Exercice pour lire une matrice dans un fichier
- Bug sur PL, 


