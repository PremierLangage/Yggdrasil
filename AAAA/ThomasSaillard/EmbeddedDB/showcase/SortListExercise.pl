extends = /AAAA/ThomasSaillard/EmbeddedDB/activities/SortListSurvey.pl

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

question_a = Triez ces nombres en ordre décroissant

items_a==
6
7
4
5
2
1
==

# Si vous voulez afficher toutes les combinaisons de réponses possibles:
# all_possibilities = True

evaluator==#|py|
score = 0
q1 = get_question('1')
qa = get_question('a')
if q1.answers == ["-5","1", "2", "3","5","7","8","10"] and qa.answers == ['7', '6', '5', '4', '2', '1']:
    score = 100
==

include_stats_score = True