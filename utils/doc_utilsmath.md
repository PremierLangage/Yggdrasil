# Module `utilsmath`

Le module `utilsmath` contient des outils pour faciliter la programmation d'exercices PL de mathématiques. Il s'appuie largement sur les classes et les fonctions du package `sympy`.

## Génération aléatoire d'objets mathématiques

Le module `utilsmath` contient des fonctions permettant de générer aléatoirement des objets de type sympy :
- nombres complexes à coefficients aléatoies
- polynômes à coefficients aléatoires
- intervalles dont la nature des bornes est aléatoire
- matrices à coefficients aléatoires
- etc.

## Conversion d'objets de type sympy en code Latex

Il est essentiel, pour la génération des énoncés des exercices PL, de pouvoir convertir des objets de type sympy en code Latex. Le package `sympy` offre un convertisseur Latex assez puissant et paramétrable (sous forme d'une classe). Mais ce convertisseur a certains manques. Par exemple, il ne permet pas d'utiliser des crochets inversés pour les bornes ouvertes des intervalles. C'est pourquoi le module `utilsmath` contient son propre convertisseur Latex, qui hérite du convertisseur du package `sympy` en lui ajoutant certaines fonctionnalités.

Pour des raisons pratiques, le module `utilsmath` contient une instance `LatexPrinter` de ce convertisseur et une fonction `latex` qui encapsule la méthode de conversion de ce convertisseur.

~~~~
import sympy as sp
from utilsmath import latex
code=latex(sp.Interval.Lopen(0, 2))
~~~~

~~~~
import sympy as sp
from utilsmath import LatexPrinter
from utilsmath import latex
LatexPrinter._settings.update({'interv_rev_brack': False})
code=latex(sp.Interval.Lopen(0, 2))
~~~~

## Analyse des réponses

Dans un exercice PL, la réponse de l'élève est souvent donnée sous forme d'une chaîne de caractères. Pour analyser une telle réponse une stratégie consiste à :
- convertir la chaîne en un objet de type `sympy` (Expr, Set, Interval, Poly, Matrix, etc.)
- effectuer un certain nombre de tests sur cet objet de type `sympy` (égalité avec la solution, forme, etc.)

Le module `utilsmath` contient des fonctions pour analyser les types de réponses les plus courants :
- nombre
- fraction
- nombre complexe
- nombre complexe sous forme cartésienne
- polynôme
- polynôme développé
- polynôme factorisé
- intervalle
- ensemble fini
- fonction
- etc.

Toutes ces fonctions d'analyses sont nommées avec le préfixe `ans_` et renvoient leur analyse sous la même forme :
- un score
- un numéro d'erreur
- un texte d'erreur

