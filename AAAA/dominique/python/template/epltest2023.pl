


title= Pltest avec evaluator
text= Changer ce text

@ feedback2023.py [feedback2.py] # utilisé par pltest_doc 
@ plrunner2023.py [pltest_doc.py] # utilisé par grader 
@ /grader/evaluator_v1.py [grader.py]
@ template2023.html [template.html] # utilisé par feedback2
# 

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]

before ==

text += "\n# vous n'avez pas défini de before"

== 


evaluator==

grade=(1000,"Bravo")

==



editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

settings.allow_reroll=1



