
extends=/ComputerScience/python/template/qcm_template.pl

title= top-down ou bottom-up
text==
Rappeler ce qu'est une conception top-down ou bottom-up.  
Quelle est votre préférence et pourquoi ? 

Répondez avec vos mots et en moins de 5 lignes.
==

# A default grader (giving the 100 mark)
@ /grader/evaluator.py [grader.py]

evaluator==
grade=(100,"# Merci de vos commentaires.\n Toute l'équipe PL. ")
==

@ /utils/sandboxio.py
@ /builder/none.py [builder.py]
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html


