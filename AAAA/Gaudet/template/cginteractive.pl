
# Ceci est un template pour faire des exercices avec la balise de correction cgtest
# Il s'agit d'une adaptation du template pltest
doc==
Ce template permet d'écrire des exercices pouvant être résolus dans un langage au choix de l'étudiant.

Par rapport à la version basique, celle-ci permet plus d'interactivité avec le programme étudiant en réalisant plus qu'une seule entrée, et une seule sortie.
Cela nécessite cependant d'écrire un script Python permettant de communiquer avec et d'évaluer le programme de l'étudiant et est donc plus complexe dans son utilisation.



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