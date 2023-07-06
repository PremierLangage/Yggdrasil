extends = /AAAA/Antonin/modules/Statistics/activities/MatchListSurvey.pl

title= MatchList Probleme Etudiants

text==
Relier chaque problème "vos étudiants" à sa solution 
==

teacher_name=revuz

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
score = max(0, (8 - nombre_erreurs)) * 100 / 8
==

# options
include_stats_score = True
include_stats_participation = True
