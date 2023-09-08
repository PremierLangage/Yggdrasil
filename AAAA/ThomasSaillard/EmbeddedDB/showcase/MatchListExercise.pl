extends = /AAAA/ThomasSaillard/EmbeddedDB/activities/MatchListSurvey.pl

title= Dummy Title MatchListResponse

text==
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`MatchListResponse.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/MatchListSurvey.pl).

Il contient l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

==

matches==
test,1
a,2,3
b,1,4
==

multiple = True

evaluator==#|py|
if nombre_erreurs == 0:
    score = 100
else:
    score = 0
==

# options
include_stats_score = True
include_stats_participation = True
