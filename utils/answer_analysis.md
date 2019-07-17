# Fonctions d'analyse des réponses

Dans le modèle d'exercice `mathexpr`, la réponse de l'élève est une chaîne de caractères écrite en langage Latex et représentant une expression mathématique. 
Le module `utilsmath` fournit des fonctions pour analyse de ce genre de réponse pour les

## Analyse complète d'une réponse

Toutes les fonctions d'analyse complète de réponse ont un fonctionnement et une syntaxe similaire.

Elles prennent en paramètre :
- la réponse brute de l'élève sous forme d'une chaîne de caractères écrite en langage Latex ;
- un objet sympy 

Elles renvoient trois valeurs :
- une note comprise entre 0 et 100 ou égale à -1 ;
- un nom indiquant le résultat de l'analyse () ;
- un message d'analyse erreur ou d'avertissement ;

## Nombres

#### `ans_number`

Cette fonction effectue les opérations suivantes :
1. convertit `strans` en une expression sympy `ans` et renvoie un avertissement en cas d'échec.
2. teste si `ans` est un nombre et renvoie un avertissement si ce n'est pas le cas.
3. teste si `ans` est égale à `sol` et renvoie une note égale à 0 si ce n'est pas le cas.
4. teste si `ans` n'utilise que des fonctions autorisées et renvoie un avertissement si ce n'est pas le cas.
5. teste si `ans` est un nombre rationnel non simplifié et renvoie un avertissement si ce n'est pas le cas.

#### `ans_frac`

Cette fonction effectue les opérations suivantes :
1. convertit `strans` en une expression sympy `ans` et renvoie un avertissement en cas d'échec.
2. teste si `ans` est écrite sous la forme d'une fraction d'entiers et renvoie un avertissement si ce n'est pas le cas.
3. teste si `ans` est égale à `sol` et renvoie une note égale à 0 si ce n'est pas le cas.
4. teste si `ans` est écrite sous la forme d'une fraction irréductible et renvoie un avertissement si ce n'est pas le cas.

### Nombres complexes

#### `ans_complex_cartesian(strans,imaginary_unit,sol)`

Cette fonction effectue les opérations suivantes :
1. convertit `strans` en une expression sympy `ans` et renvoie un avertissement en cas d'échec.
2. teste si `ans` est écrite sous forme cartésienne (a + bi) et renvoie un avertissement si ce n'est pas le cas.
3. teste si `ans` est égale à `sol` et renvoie une note égale à 0 si ce n'est pas le cas.
4. teste si les parties réelles et imaginaires sont simplifiées et renvoie un avertissement si ce n'est pas le cas.

## Ensembles finis

#### `ans_finite_set(strans,sol)`

Cette fonction effectue les opérations suivantes :
1. convertit `strans` en un ensemble sympy `ans` et renvoie un avertissement en cas d'échec.
2. teste si `ans` est égale à `sol` et renvoie une note égale à 0 si ce n'est pas le cas.


## Polynômes

#### `ans_poly_expanded(strans,sol,x):`

Cette fonction effectue les opérations suivantes :
1. convertit `strans` en une expression sympy `ans` et renvoie un avertissement en cas d'échec ;
2. teste si `ans` est un polynôme en la variable `x` et renvoie un avertissement si ce n'est pas le cas ;
3. teste si `ans` est écrite comme une somme de monômes en `x` et renvoie un avertissement si ce n'est pas le cas ;
4. teste si `ans` est égale à `sol` et renvoie une note égale à 0 si ce n'est pas le cas ;
4. teste si les coefficients rationnels sont simplifiés et renvoie un avertissement si ce n'est pas le cas.

