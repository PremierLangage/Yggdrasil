# Champ de réponse `sortlist`

Liste à trier.

## Insertion

~~~
form ==
{{input_name}}
==

input.name.type = sortlist
~~~

## Configuration

`style`

Chaîne définissant le style de l'élément contenant le champ de réponse.

`choices`

Texte multi-lignes contenant les différents choix possibles.

`numsol`

Numéro de la solution.

## Réponse renvoyée

`answer['name']['eval']`

True si la liste est correctement triée, False sinon.

`answer['name']['order']`

Ordre.





