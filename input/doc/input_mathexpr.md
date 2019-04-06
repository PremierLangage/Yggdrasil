# Champ de réponse `mathexpr`

## Résumé

Ce champ de réponse est adapté à la saisie d'expressions mathématiques (nombres, expressions algébriques, fonctions, ensembles, etc.) La saisie se fait avec le clavier usuel ou avec un clavier virtuel attaché au champ de réponse et contenant les symboles mathématiques nécessaires. La saisie est automatiquement mise en forme en MathML.

## Insertion

On insère un champ de réponse `mathexpr` dans un exercice en insérant l'expression `{{input_name | safe}}` dans la clé `form` de l'exercice.

~~~
form ==
{{input_name | safe}}
==

input.name.type = mathexpr
~~~

## Configuration

`style`

Définit le style de l'élément contenant le champ de réponse. Le style par défaut est 

`virtualKeyboardMode`

Définit la façon dont clavier virtuel attaché au champ de réponse est affiché.

* `manual`:
* `onfocus`:
* `off`:

`virtualKeyboards`

Définit les couches du clavier virtuel attaché au champ de réponse.



