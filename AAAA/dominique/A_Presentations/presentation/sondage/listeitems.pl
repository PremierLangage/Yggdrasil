
extends = /AAAA/Antonin/activities/RadioSurvey.pl

e:

question_1 = Que pensez-vous de ce tutoriel ?

question_plus_pertinente = Est-ce que vous aussi vous avez du mal à finir vos...

Une liste de réponses possibles dans une variable items_X:

Où une réponse équivaut à une ligne, et l'ensemble de réponse est définis pour une question ayant été définis dans l'exercice avec l'identifiant unique X

Si une liste de réponse n'est rattachée à aucune question, elle sera perdue

Si une question n'a aucune réponse attachée, le comportement sera incomplet.

Exempl

items_1==
 sont très hétérogènes en niveaux
 ne sont pas engagés
 ont besoin d’entraînement
 n'apprennent pas le cours
 s'ennuient
 se perdent
 apprennent mal 
 ne sont pas critiques
==