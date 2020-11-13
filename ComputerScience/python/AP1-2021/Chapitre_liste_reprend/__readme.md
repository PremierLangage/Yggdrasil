# Document - Listes

Liste des exercices sur les listes, avec description simple, les tags et les changements éventuels.

Les tags sont séparés par |

Liste des tags : append | mutable | reference | listCreate | elementAccess | listCopy | ForInRange | tuple | inlist | extend | len | listRepeat | pop

En charge : Wenjie Fang

## Ex1 : Ajout d'éléments dans une liste

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/ajoute_liste-2021.pl

tag=append|reference

**Commentaire**

- Exo simple pour faire ajouter un élément
- Un exemple ajouté, un test modifié
- Tags ajoutés

## Ex1a : Les listes utilisées comme des ensembles

@ /ComputerScience/python/AP1-2021/Chapitre_liste_reprend/common-element-list-2021.pl

tag=

**Commentaire**

- Exo pour 

## Ex2 : Liste composée (création de liste par lister tous les éléments)

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/createliste-2021.pl

tag=listCreate

**Commentaire**

- Exo simple pour créer une liste en listant les éléments
- Un exemple ajouté
- Tag ajouté

## Ex3 : Ignorer les doublons d'une liste

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/doublons-2021.pl

tag=append|elementAccess|inlist

**Commentaire**

- Exo pour ajouter seulement les éléments encore absents
- Un doctest ajouté
- Tags ajoutés

## Ex4 : Entier Gauss

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/EntierGauss-2021.pl

tag=append|ForInRange|tuple

**Commentaire**

- Exo pour constuire une liste, difficulté en math
- Un soluce simplifié est ajouté, aussi avec plus de tests aléatoires
- Tags ajoutés

## Ex5 : Fusion de deux listes

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/extends-2021.pl

tag=extend|reference|listCopy

**Commentaire**

- Exo pour extend, mais append + for marche aussi
- Modifié l'énoncé pour souligner l'existence de référence, et aussi la copie de la liste
- Tags ajoutés

## Ex6 : Ajout de N éléments à une liste

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/extends_list-2021.pl

tag=reference|extend|ForInRange

**Commentaire**

- Exo pour ajouter des éléments à une liste passée en paramètre, en utilisant extend
- Tags ajoutés
- Exemple ajouté

## Ex7 : Fibonacci

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/fibo-2021.pl

tag=ForInRange|append|listCreate

**Commentaire**

- Exo pour créer une liste des nombres de Fibonacci
- Une petite clarification ajoutée, avec un peu plus de tests aléatoires
- Tags ajoutés

## Ex8 : Remplace les éléments d'une liste

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/remplace_pair-2021.pl

tag=reference|mutable|ForInRange|len

**Commentaire**

- Exo pour remplacer les éléments pairs par 1, on est obligé de parcourir la liste par indice
- Un exemple ajouté
- Tags ajoutés

## Ex9 : Création d'une liste de répétitions

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/repete-2021.pl

tag=listRepeat|ForInRange|append

**Commentaire**

- Exo pour faire répéter la liste donnée. Deux façons de faire : avec le syntaxe *, et avec un double parcours
- Inconsistence entre les tests sont fixée. Maintenant la sémantique est simplement n * l.
- Tags ajoutés
- repetezip.pl est une duplication de cet exercice

## Ex10 : Supprimer les éléments pairs

@ /ComputerScience/python/AP1-2021/Chapitre_Iterables/supprime_pair-2021.pl

tag=reference|elementAccess|pop

**Commentaire**

- Exo difficile pour supprimer les éléments pairs dans la liste en argument.
- Deux solutions possibles : soit faire pop directement dans la liste en respectant les indices, soit construire une nouvelle liste
- Tags ajoutés, hints des deux méthodes ajoutés




