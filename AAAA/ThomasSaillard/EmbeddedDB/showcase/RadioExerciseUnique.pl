extends = /AAAA/ThomasSaillard/EmbeddedDB/activities/RadioSurvey.pl

title = Exercice d'exemple | RadioGroup avec choix uniques

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`RadioSurvey.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/RadioSurvey.pl) avec le choix de réponse unique.
==

# Ici on définit que chaque choix ne sera selectionnable qu'une seule fois (voir la doc)
unique_choice = True

question_1 = Que pensez vous de cet exercice?
question_a = Et globalement de PL
question_3 = Êtes vous satisfait de l'affichage des graphes

items_1==
Très satisfaisant
Satisfaisant
Moyennement satisfaisant
Mediocre
La couleur bleu
==

items_a==
Très satisfaisant
Satisfaisant
Moyennement satisfaisant
Mediocre
La couleur bleu
==

graph_horizontal_a = 1

items_3==
Très satisfaisant
Satisfaisant
Moyennement satisfaisant
Mediocre
La couleur bleu
==

evaluator==#|py|
==
