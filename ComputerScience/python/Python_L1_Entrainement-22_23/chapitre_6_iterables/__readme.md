# Document - Itérables

Liste des exercices sur les itérables (liste, tuple, string, fichier), avec description simple, les tags et les changements éventuels.

Les exercices sont listé **en ordre ASCII** pour leur nom de fichier. Pour ajouter un exercice au milieu, veuillez utiliser le format ``Ex7c`` pour un reménagement éventuel.

Le nombre du fichier d'un exercice doit être une description biève de son contenu.

Les tags sont séparés par |

Liste des tags : 

input | split | substring | algo | stringRepeat | ForIn | stringIndex | find | immutable | ForIn | stringConcat | mutable | tuple | file | listoflist | range | extend

En charge : **Wenjie Fang**

# Ex1 : Compter les lettres "e"

@ compter-e-2021.pl

tag = ForIn | stringIndex

**Commentaires**

- Exercice facile pour compter les lettres "e"
- Tags ajoutés

# Ex2 : Compter les phrases

@ compter-phrase-2021.pl

tag = file | ForIn | stringIndex

**Commentaires**

- Exercice normal pour compter les trois ponctuation pour la fin d'une phrase.
- Il suffit de combiner "Compter les letters e" avec la lecture de fichier.

# Ex3 : Corriger les tuples saisis

@ corriger-tuple-2021.pl

tag = mutable | immutable | ForIn | tuple

**Commentaires**

- Exercice compliqué pour remplacer des occurrences selon un dictionnaire
- La difficulté consiste de la différence entre tuple et liste.
- En tout cas assez compliqué conceptuellement et aussi sur le code.

# Ex4 : Découper une liste

@ decoupe-2021.pl

tag = listoflist | ForIn | algo

**Commentaires**

- Exercice moyennement difficile pour découper une liste en des segments d'une certaine longueur.
- Difficulté en gestion de quand un segment est complet, et aussi sur le traitement du dernier segment.

# Ex5 : Fusion d'une liste de liste

@ fusion-list-2021.pl

tag = listoflist | extend

**Commentaires**

- Exercice simple pour fusionner les éléments dans une liste de listes.

# Ex6 : Recherche de motif dans un fichier

@ grep-2021.pl

tag = file | ForIn | substring

**Commentaires**

- Exercice simple qui simule la fonctionalité de la commande grep en linux

# Ex7 : Lire les premiers lignes

@ head-2021.pl

tag = file | ForIn | break

**Commentaires**

- Exercice simple qui simule la fonctionalité de la commande head en linux, mais seulement 5 lignes.

# Ex8 : Répétition au début (trouver le préfixe qui se répète le plus)

@ head-repeat-2021.pl

tag = substring | algo | stringRepeat

**Commentaires**

- Exercice difficile avec des cas limits

# Ex9 : Lire une liste (parser une liste séparée pas les espaces)

@ lireuneliste-2021.pl

tag = input | split

**Commentaires**

- Bugfix : il roule maintenant sur plsoluce, pas inputgenerator
- Tags ajoutés

# Ex10 : Progression arithmétique, mais sans boucle

@ progression-arithmetique-2021.pl

tag = range

**Commentaires**

- Exercice pour l'utilisation de range. La seule difficulté est le cas où la raison est 0.

# Ex11 : Remplacer les k par g

@ remplace-k-par-g-2021.pl

tag = immutable | ForIn | stringConcat

**Commentaires**

- Exercice pour parcourir et remplacer les caractères dans une chaîne.
- Notion d'objet non mutable, sinon une solution simple est de faire un parcours et changer les lettres directement.

# Ex12 : Renverser une chaîne

@ renverser-chaine-2021.pl

tag = string | stringIndex

**Commentaires**

- Exercice simple pour renverser une chaîne de caractères.
- Très facile si on sait comment faire le splice correctement, moyennement facile si on ne sait pas.

# Ex13 : Trouver tous les occurrences

@ str-occu-2021.pl

tag = find | algo

**Commentaires**

- Exercice moyenne-difficile pour rechercher tous les occurrences d'une sous-chaîne

# Ex14 : Rotation de chaîne de caractères

@ str-rotate-2021.pl

tag = substring

**Commentaires**

- Exercice un peu astucieux pour faire la rotation

# Ex15 : Compter les lignes

@ wcl-2021.pl

tag = file | ForIn

**Commentaires**

- Exercice simple pour entraîner la lecture de fichier










--------------------------------


# ExA : Lire une matrice

@ ~matrix-file-2021.pl

tag = file | listoflist | split | ForIn

**Commentaires**

- Exercice pour lire une matrice dans un fichier
- Bug sur PL, see https://github.com/PremierLangage/premierlangage/issues/434

# ExB : Lire les dernières lignes

@ ~tail-2021.pl

tag = file | ForIn | algo

**Commentaires**

- Exercice pour simuler la commande tail de linux.
- Bug sur PL, see https://github.com/PremierLangage/premierlangage/issues/434


