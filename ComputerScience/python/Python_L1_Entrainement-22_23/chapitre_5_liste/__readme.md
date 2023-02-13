# Document - Listes

Liste des exercices sur les listes, avec description simple, les tags et les changements éventuels.

Les exercices sont listé **en ordre ASCII** pour leur nom de fichier. Pour ajouter un exercice au milieu, veuillez utiliser le format ``Ex7c`` pour un reménagement éventuel.

Le nombre du fichier d'un exercice doit être une description biève de son contenu.

Les tags sont séparés par |

Liste des tags : append | mutable | reference | listCreate | elementAccess | listCopy | ForInRange | tuple | inlist | extend | len | listRepeat | pop | math | algo

En charge : **Wenjie Fang**

## Ex1 : Ajout d'éléments dans une liste

@ ajoute_liste-2021.pl

tag=append|reference

**Commentaire**

- Exo simple pour faire ajouter un élément
- Un exemple ajouté, un test modifié
- Tags ajoutés

## Ex2 : Liste composée (création de liste par lister tous les éléments)

@ createliste-2021.pl

tag=listCreate

**Commentaire**

- Exo simple pour créer une liste en listant les éléments
- Un exemple ajouté
- Tag ajouté

## Ex3 : Ignorer les doublons d'une liste

@ doublons-2021.pl

tag=append|elementAccess|inlist

**Commentaire**

- Exo pour ajouter seulement les éléments encore absents
- Un doctest ajouté
- Tags ajoutés

## Ex4 : Entier Gauss

@ EntierGauss-2021.pl

tag=append|ForInRange|tuple|math

**Commentaire**

- Exo pour constuire une liste
- Un soluce simplifié est ajouté, aussi avec plus de tests aléatoires
- Tags ajoutés
- Correction du sujet (Merci Chaohui !)

## Ex5 : Est-ce qu'il y a un impair ?

@ existe_impair-2021.pl

tag=elementAccess

**Commentaire**

- Exo facile pour tester l'existence des éléments impairs
- Tags et exemples ajoutés

## Ex6 : Fusion de deux listes

@ extends-2021.pl

tag=extend|reference|listCopy

**Commentaire**

- Exo pour extend, mais append + for marche aussi
- Modifié l'énoncé pour souligner l'existence de référence, et aussi la copie de la liste
- Tags ajoutés

## Ex7 : Ajout de N éléments à une liste

@ extends_list-2021.pl

tag=reference|extend|ForInRange

**Commentaire**

- Exo pour ajouter des éléments à une liste passée en paramètre, en utilisant extend
- Tags ajoutés
- Exemple ajouté

## Ex8 : Fibonacci

@ fibo-2021.pl

tag=ForInRange|append|listCreate

**Commentaire**

- Exo pour créer une liste des nombres de Fibonacci
- Une petite clarification ajoutée, avec un peu plus de tests aléatoires
- Tags ajoutés

## Ex8a : Histogramme

@ histogramme-2021.pl

tag=elementAccess|in|append|tuple

**Commentaire**

- Exo un peu compliqué pour faire l'histogramme.
- La difficulté est de bien manipuler les tuples dans une liste et de faire un parcours correspondant.

## Ex9 : Statistiques sur une liste

@ liststat-2021.pl

tag=elementAccess|tuple

**Commentaire**

- Exo simple pour compter les pairs et les impairs dans la liste
- Tags et exemples ajoutés

## Ex10 : Un split sur la parité

@ pair_impair-2021.pl

tag=elementAccess|append|listCreate

**Commentaire**

- Exo simple pour séparer les élements pairs et impairs dans une liste et de les mettre dans deux listes séparées
- Tags et exemples ajoutés

## Ex10a : Plat en tenant compte de l'allergie

@ plat-allergie-2021.pl

tag=elementAccess|in|append

**Commentaire**

- Exo pour éliminer les éléments dans une liste qui apparaissent aussi dans une autre.

## Ex11 : Premiers entiers

@ premiers_entiers-2021.pl

tag=append|listCreate

**Commentaire**

- Exo simple pour construire une liste des premiers entiers
- Tags et explication ajoutés

## Ex12 : Remplace les éléments d'une liste

@ remplace_pair-2021.pl

tag=reference|mutable|ForInRange|len

**Commentaire**

- Exo pour remplacer les éléments pairs par 1, on est obligé de parcourir la liste par indice
- Un exemple ajouté
- Tags ajoutés

## Ex13 : Création d'une liste de répétitions

@ repete-2021.pl

tag=listRepeat|ForInRange|append

**Commentaire**

- Exo pour faire répéter la liste donnée. Deux façons de faire : avec le syntaxe *, et avec un double parcours
- Inconsistence entre les tests sont fixée. Maintenant la sémantique est simplement n * l.
- Tags ajoutés
- repetezip.pl est une duplication de cet exercice

## Ex14 : Sous-liste et sous-suite

@ soussuite-2021.pl

tag=elementAccess|ForInRange|len|algo

**Commentaire**

- Exo très difficle pour tester pour sous-liste (consécutive) et sous-suite (non-consécutive)
- A donner aux étudiants avec soins.
- Inconsistence entre l'énoncé et les tests sont fixé. Aussi un nouveau mise-en-page.
- Tags ajoutés

## Ex15 : Supprimer les éléments pairs

@ supprime_pair-2021.pl

tag=reference|elementAccess|pop

**Commentaire**

- Exo difficile pour supprimer les éléments pairs dans la liste en argument.
- Deux solutions possibles : soit faire pop directement dans la liste en respectant les indices, soit construire une nouvelle liste
- Tags ajoutés, hints des deux méthodes ajoutés

## Ex16 : Intégrer deux listes

@ zip-list-2021.pl

tag=len|elementAccess|tuple|append

**Commentaire**

- Exo un peu difficile pour "zipper" deux listes en une avec des couples.
- La difficulté réside en comment traiter les cas où les longueurs des listes sont différentes.

# Exo trop difficile

## Ex.A : Les listes utilisées comme des ensembles

@ ~common-element-list-2021.pl

**Commentaire**

- Exo très dur pour simuler set avec les listes
- Problématique. Trop de confusion, et les tests sont fait de façon bizarre.
- A éviter avant de réviser complètement.

## Ex.B : Lire une liste

@ ~lireunelist-2021.pl

**Commentaire**

- Exo difficle pour simuler split
- Problématique. L'instruction n'est pas claire, et il faut les itérables (sur les chaînes).
- Il faut le reprendre avec les itérables, et remis sous forme de 'écrire une fonction'.

## Ex.C : Lire une liste d'entiers

@ ~lireunelistint-2021.pl

**Commentaire**

- Exo pour utiliser split
- Problématique. Il faut les itérables (sur les chaînes).
- Il faut le reprendre avec les itérables, et remis sous forme de 'écrire une fonction'.

