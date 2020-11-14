# Document - Listes

Liste des exercices sur les listes, avec description simple, les tags et les changements éventuels.

Les tags sont séparés par |

Liste des tags : append | mutable | reference | listCreate | elementAccess | listCopy | ForInRange | tuple | inlist | extend | len | listRepeat | pop | math |algo

En charge : Wenjie Fang

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

tag=append|ForInRange|tuple

**Commentaire**

- Exo pour constuire une liste, difficulté en math
- Un soluce simplifié est ajouté, aussi avec plus de tests aléatoires
- Tags ajoutés

## Ex4a : Est-ce qu'il y a un impair ?

@ existe_impair-2021.pl

tag=elementAccess

**Commentaire**

- Exo facile pour tester l'existence des éléments impairs
- Tags et exemples ajoutés

## Ex5 : Fusion de deux listes

@ extends-2021.pl

tag=extend|reference|listCopy

**Commentaire**

- Exo pour extend, mais append + for marche aussi
- Modifié l'énoncé pour souligner l'existence de référence, et aussi la copie de la liste
- Tags ajoutés

## Ex6 : Ajout de N éléments à une liste

@ extends_list-2021.pl

tag=reference|extend|ForInRange

**Commentaire**

- Exo pour ajouter des éléments à une liste passée en paramètre, en utilisant extend
- Tags ajoutés
- Exemple ajouté

## Ex7 : Fibonacci

@ fibo-2021.pl

tag=ForInRange|append|listCreate

**Commentaire**

- Exo pour créer une liste des nombres de Fibonacci
- Une petite clarification ajoutée, avec un peu plus de tests aléatoires
- Tags ajoutés

## Ex7a : Statistiques sur une liste

@ liststat-2021.pl

tag=elementAccess|tuple

**Commentaire**

- Exo simple pour compter les pairs et les impairs dans la liste
- Tags et exemples ajoutés

## Ex7b : Un split sur la parité

@ pair_impair-2021.pl

tag=elementAccess|append|listCreate

**Commentaire**

- Exo simple pour séparer les élements pairs et impairs dans une liste et de les mettre dans deux listes séparées
- Tags et exemples ajoutés

## Ex7c : Premiers entiers

@ premiers_entiers-2021.pl

tag=append|listCreate

**Commentaire**

- Exo simple pour construire une liste des premiers entiers
- Tags et explication ajoutés

## Ex8 : Remplace les éléments d'une liste

@ remplace_pair-2021.pl

tag=reference|mutable|ForInRange|len

**Commentaire**

- Exo pour remplacer les éléments pairs par 1, on est obligé de parcourir la liste par indice
- Un exemple ajouté
- Tags ajoutés

## Ex9 : Création d'une liste de répétitions

@ repete-2021.pl

tag=listRepeat|ForInRange|append

**Commentaire**

- Exo pour faire répéter la liste donnée. Deux façons de faire : avec le syntaxe *, et avec un double parcours
- Inconsistence entre les tests sont fixée. Maintenant la sémantique est simplement n * l.
- Tags ajoutés
- repetezip.pl est une duplication de cet exercice

## Ex9a : Sous-liste et sous-suite

@ soussuite-2021.pl

tag=elementAccess|ForInRange|len|algo

**Commentaire**

- Exo très difficle pour tester pour sous-liste (consécutive) et sous-suite (non-consécutive)
- A donner aux étudiants avec soins.
- Inconsistence entre l'énoncé et les tests sont fixé. Aussi un nouveau mise-en-page.
- Tags ajoutés

## Ex10 : Supprimer les éléments pairs

@ supprime_pair-2021.pl

tag=reference|elementAccess|pop

**Commentaire**

- Exo difficile pour supprimer les éléments pairs dans la liste en argument.
- Deux solutions possibles : soit faire pop directement dans la liste en respectant les indices, soit construire une nouvelle liste
- Tags ajoutés, hints des deux méthodes ajoutés



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


