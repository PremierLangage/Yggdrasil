
# Ceci est un template pour faire des exercices avec la balise de correction cgtest
# Il s'agit d'une adaptation du template pltest
doc==
La liste des langages utilisables actuellement est : c, cpp, python, java, ocaml
==
grader  =@ ./cginteractivegrader.py
builder =@ ./cgbuilder.py

@ ./utils/feedback2.py
@ ./utils/template.html
@ ./utils/langhandlers.py
@ ./utils/cginteractive.py
@ /utils/sandboxio.py

settings.allow_reroll = 1

editor =: CodeEditor
editor.theme = dark
editor.height = 500px

# une interface standard d'exercice avec un editeur pour la réponse
form==
{{editor|component}}
==

languages==
==