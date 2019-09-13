# Introduction

Un exercice sur la plateforme PL est défini en choisissant un **player** et en affectant des valeurs à un ensemble de **clés**.

Lorsque l'exercice est lancé sur la plateforme, le player construit la page web de l'exercice (énoncé, champs de réponse) à partir des valeurs contenues dans les clés. Après que l'élève a validé sa réponse, le player évalue cette réponse et modifie la page web de l'exercice (feedback), toujours en utilisant les valeurs contenues dans les clés.

Les clés peuvent contenir du texte, des valeurs numériques ou des données structurées (liste, dictionnaire).

En pratique, pour chaque exercice, ces données sont écrites dans un fichier texte, d'extension `.pl`, selon une syntaxe dédiée.

### Player


Plusieurs players sont disponibles.
- Le player `basic` est un player générique qui permet de produire les données de l'exercice et d'évaluer la réponse de l'élève à l'aide de scripts Python. 
- Le player `maths` est une variante du player `basic` qui inclut automatiquement un certain nombre d'outils mathématiques (en particulier Sympy).

Il est également possible de créer ses propres players.

### Clés

Chaque player utilise un certain nombre de clés (dont les noms sont fixés). Certaines clés sont obligatoires, d'autres facultatives. et auxquelles
Les **clés** peuvent recevoir  
Ce contenu est interprété par le player. En particulier, le contenu textuel de certaines clés est interprété comme du code (HTML, Python ou autre).

### Fichier PL

# Edition des fichiers pl

# Un premier exemple avec le player `basic`

```
extends = basic.pl

input =: Input
input.type = text

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
sol=a+b
==

text ==
Calculer {{a}} + {{b}}.
==

form ==
{{ input | component }}
==

evaluator ==
try:
    n=int(input.value)
    if n==sol:
        score=100
    else:
        score=0
except:
    score=-1
==
```
# Builder `before` et grader `evaluator`

## Résumé

Le builder `before` et le grader `evaluator` permettent :
* l'utilisation de scripts Python pour la génération des données de l'exercice et l'évaluation de la réponse ;
* l'inclusion de champs de réponse et d'éléments prédéfinis dans l'énoncé ;
* la gestion du scénario de l'exercice (nombre de tentatives, niveaux de feedback) ;
* la mise en forme automatique du feedback.

## Clés

`before`

Script Python exécuté avant l'affichage de l'exercice. 

`text`

Enoncé de l'exercice.

`form`

Enoncé de l'exercice.

`input`

Dictionnaire de configuration des champs de réponse.

`element`

Dictionnaire de configuration des éléments.

`evaluator`

Script Python exécuté après chaque validation de l'exercice.

`score`

`feedback`

`maxattempts`


