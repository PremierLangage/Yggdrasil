# Fonctions d'analyse des réponses

Le composant `MathInput` permet à l'élève d'écrire facilement une expression mathématique complexe avec un rendu de type TeX. La valeur fournie par le composant `MathInput` est une chaîne de caractères écrite en langage LaTeX.

Le module `utilsmath` fournit des fonctions d'analyse pour les réponses mathématiques.

## Syntaxe générale

Toutes les fonctions d'analyse de réponse ont une syntaxe similaire.

Elles prennent en paramètre :
- la réponse de l'élève sous forme d'une chaîne de caractères écrite en langage LaTeX ;
- la réponse attendue sous forme d'un objet SymPy ;
- un certains nombre d'options.

Elles renvoient trois valeurs :
- une note comprise entre 0 et 100 ou égale à -1 ;
- un code indiquant le résultat de l'analyse;
- un message d'analyse ;

~~~
>>> from sympy import I

>>> ans_complex("2i+2",2*I+2)
(100, 'RightAnswer', '')

>>> ans_complex("2\\sqrt{2}e^{\\frac{i\\pi }{4}}",2*I+2)
(100, 'RightAnswer', '')

>>> ans_complex("2i+1",2*I+2)
(0, 'NotEqual', '')

>>> ans_complex("2i+a",2*I+2)
(-1, 'NotCplx', "Votre réponse n'est pas un nombre complexe.")

>>> ans_complex("2i+(1",2*I+2)
(-1, 2, "Votre réponse n'est pas une expression valide.")
~~~

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


