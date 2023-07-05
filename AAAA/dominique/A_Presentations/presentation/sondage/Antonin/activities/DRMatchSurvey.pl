extends = /AAAA/Antonin/modules/Statistics/activities/MatchListSurvey.pl

title= Dummy Title MatchListResponse

text==
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`MatchListResponse.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/MatchListSurvey.pl).

Il contient l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

==

matches==
ont besoin d’entraînement, exercice répétable aléatoires
n'apprennent pas le cours, Quizz pré-cours
s'ennuient, Activité hors programme 
se perdent, Ontologies support
sont très hétérogènes en niveaux, Etayage
apprennent mal, analyse de parcours
ne sont pas critiques, Evaluation par les pairs
ne sont pas engagés, ludification et réussite
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