extends = /AAAA/Antonin/activities/RadioSurvey.pl

title = Exercice d'exemple | RadioGroup

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`RadioSurvey.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/RadioSurvey.pl).
==

question_1 = Que pensez vous de cet exercice?
question_2 = Et globalement de PL
question_3 = Êtes vous satisfait de l'affichage des graphes

items==
Très satisfaisant
Satisfaisant
Moyennement satisfaisant
Mediocre
La couleur bleu
==

evaluator==#|py|
score = 42
if (unique_choice != "False") and (len(answer) != int(NUMBER_QUESTIONS)):
    score = 0
==

include_stats_score = True
include_stats_participation = True