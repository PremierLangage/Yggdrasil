extends = /AAAA/Antonin/activities/RadioSurvey.pl

title = Exercice d'exemple | RadioGroup avec choix uniques | Mode Enseignant

text==#|markdown|
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`RadioSurvey.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/RadioSurvey.pl) avec le choix de réponse unique.
==

# Ici on définit que chaque choix ne sera selectionnable qu'une seule fois (voir la doc)
unique_choice = True

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