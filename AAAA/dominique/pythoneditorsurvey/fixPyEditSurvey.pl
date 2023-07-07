extends = /AAAA/Antonin/modules/Statistics/activities/CodeEditorSurvey.pl

@ /AAAA/dominique/pythoneditorsurvey/plteststatsgrader.py [grader.py]

# default evaluator dummy
evaluator==#|py|
==

extends = /AAAA/dominique/A_Presentations/presentation/sondage/correctionTemplate.pl

stopfirsterror= True
pltest==
>>> prime(1)
1
>>> prime(2)
1 2
>>> prime(3)
1 2 3 
==

title= Test de correction de Code 

text ==#|markdown|

On vous propose d'écrire une fonction prime(N) qui affiche les N premier nombres premiers.

==

before +==
corhtml = feedback.render()
text += corhtml 
==