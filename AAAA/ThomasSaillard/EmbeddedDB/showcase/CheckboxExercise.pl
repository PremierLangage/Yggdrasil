extends = /AAAA/ThomasSaillard/EmbeddedDB/activities/CheckboxSurvey.pl

title = Exercice d'exemple | Checkbox

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`Checkbox.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/CheckboxSurvey.pl).

Il contient l'affichage des réponses par question ainsi que l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

==

question_1 = Que pensez vous de cet exercice?

items_1==
Très satisfaisant
Satisfaisant
Moyennement satisfaisant
Mediocre
La couleur bleu
==

graph_combinations_1 = 1

graph_horizontal_1 = 1

question_2 = Et que pensez-vous des gens qui ne finissent pas leurs ...

items_2==
Pas grand
Leurs quoi?
J'aime bien surtout ceux
==

# Si vous voulez afficher toutes les combinaisons de réponses possibles:
# all_possibilities = True