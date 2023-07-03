extends = /AAAA/Antonin/modules/Statistics/activities/SortListSurvey.pl

title = Exercice d'exemple | SortList

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`SortList.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/SortListSurvey.pl).

Il contient l'affichage des réponses par question ainsi que l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

==

question_1 = Triez ces nombres en ordre croissant

items_1==
1
2
3
5
-5
7
8
10
==

graph_horizontal_1 = 1

# Si vous voulez afficher toutes les combinaisons de réponses possibles:
# all_possibilities = True

evaluator==#|py|
score = 0
q1 = get_question('1')
if q1.answers == ["1", "2", "3"]:
    score = 100
==

include_stats_score = True