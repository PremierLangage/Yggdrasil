extends = /AAAA/Thomas/Sondage-06-07-2023/checkboxSurvey/CheckboxSurvey.pl

title = Exercice d'exemple | Checkbox

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`Checkbox.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/CheckboxSurvey.pl).

Il contient l'affichage des réponses par question ainsi que l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

==

question_1 = Que se passe-t-il avec vos étudiants ? 

items_1==
Vos étudiants ont besoin d’entraînement
Vos étudiants n'apprennent pas le cours
Vos étudiants s'ennuient
Vos étudiants se perdent
Vos étudiants sont très hétérogènes en niveaux
Vos étudiants apprennent mal 
Vos étudiants ne sont pas critiques
Vos étudiants ne sont pas engagés
==

graph_combinations_1 = 1
graph_horizontal_1 = 1


# Si vous voulez afficher toutes les combinaisons de réponses possibles:
# all_possibilities = True