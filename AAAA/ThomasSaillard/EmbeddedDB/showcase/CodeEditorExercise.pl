extends = /AAAA/ThomasSaillard/EmbeddedDB/activities/CodeEditorSurvey.pl

title= Dummy Title CodeEditorResponse

text==
Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`CodeEditorResponse.pl` dont voici la documentation](filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/CodeEditorSurvey.pl).

Il contient l'affichage des deux graphes par défaut optionnels:

- statistiques des scores 

- statistiques de participation

## Exemple :
Renseignez un code avec une condition simple

Scoring:

- if = 100pt

- else = 42pt

==

editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

evaluator==#|py|
if "if" in editor.code:
    score = 100
elif "else" in editor.code:
    score = 42
else:
    score = 0
==

# options
include_stats_score = True
include_stats_participation = True