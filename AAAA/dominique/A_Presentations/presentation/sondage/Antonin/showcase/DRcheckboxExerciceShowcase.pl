extends = /AAAA/Antonin/activities/CheckboxSurvey.pl

title = Exercice d'exemple | Checkbox

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`Checkbox.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/CheckboxSurvey.pl).

Il contient l'affichage des réponses par question ainsi que l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

==

question_1 = Quel est le problème principale avec vos étudiants ?

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

graph_horizontal_1 = 1

#graph_combinations_1 = 1
# pour afficher l'ancien affichage de combinaisons