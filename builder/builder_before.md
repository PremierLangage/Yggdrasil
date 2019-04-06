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
