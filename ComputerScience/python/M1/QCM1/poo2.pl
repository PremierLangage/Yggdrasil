
extends=/ComputerScience/python/template/qcm_template.pl

title= top-down ou bottom-up
text==
Rappeler ce qu'est une conception top-down ou bottom-up.  
Quelle est votre préférence et pourquoi ? 

Répondez avec vos mots et en moins de 5 lignes.
==

grader=@/template/openevaluator.py
@ /utils/sandboxio.py
builder=@ /template/donobuild.py
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html

