# Modèle `mathbasic`

## Résumé

Ce modèle d'exercice permet l'utilisation de scripts Python pour la génération des données de l'exercice et l'évaluation de la réponse.

* **Inclusion :** `extends = /template/mathbasic.pl`

* **Dépendances :**
    * @ /utils/sandboxio.py
    * @ /utils/plrandom.py
    * @ /utils/utilsmath.py
    * @ /builder/before.py [builder.py]
    * @ /grader/evaluator.py [grader.py]

* **Clés utilisées**: 
___


## Clés

`before`

Script Python exécuté avant l'affichage de l'exercice. 

Un certain nombre de classes et de fonctions sont chargées par défaut :
- les principales classes et fonctions du module de calcul symbolique SymPy (https://docs.sympy.org) ;
- des fonctions de génération aléatoire d'objets SymPy ;
- des fonctions de conversion des objets SymPy en LateX.

```
before ==
A=rand_int_matrix(3,3,5)
sol=trace(A)
latexA=latex(A)
==
```
De plus, les valeurs de toutes les autres clés définies dans le fichier sont accessibles.

```
matsize = 3

before ==
A=rand_int_matrix(int(matsize),int(matsize),5)
sol=trace(A)
latexA=latex(A)
==
```

`text`

Enoncé de l'exercice.

`evaluator`

Script Python exécuté après chaque validation de la réponse.

Un certain nombre de classes et de fonctions sont chargées par défaut :
- les principales classes et fonctions du module de calcul symbolique SymPy (https://docs.sympy.org) ;
- des fonctions de génération aléatoire d'objets SymPy ;
- des fonctions de conversion des objets SymPy en LateX ;
- des fonctions d'analyse des réponses.
