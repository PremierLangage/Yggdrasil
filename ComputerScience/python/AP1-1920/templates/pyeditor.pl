# 01/10/2019 : A quoi sert ce template !!

doc==
ceci est un template pour écrire des exercices de python.

Il ne contient pas beaucoup de fonctions d'aides pour gérer les réponses faites par l'etudiant.

Vous pouvez peut être si vous ne l'avez pas fait jeter un oeil sur les templates suivants:

dans le repertoire 
/ComputerScience/python/AP1-1920/templates/
les templates 

pltest
plsoluce
/ComputerScience/python/template/qcm_template

IL est necessaire d'écrire de nouveau templates avec les composants .

==


component =: CodeEditor

component.code ==
import os
==
#component.theme = white
component.language = python


form==
{{component|component }}
==

evaluator==
grade = (100,str( component.code))
==

title= TEMPLATE modifiez le titre TEMPLATE
text=

before==
text=doc
==

@ /utils/sandboxio.py 
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]





