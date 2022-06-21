# Date : 16/06/2022
# Auteur : Clément Gaudet

doc==
Ce template permet de faire des exercices pouvant être résolu avec différents langages, au choix
de l'étudiant. 

Le programme étudiant est compilé et exécuté pour faire les tests. La communication se fait directement par
entrée et sortie standard.

La batterie de test est à mettre dans la variable testcases sous forme d'une liste python contenant
des tuples de la forme (chaine a mettre dans stdin, chaine à recevoir dans stdout, chaine correspondant au nom du test)

La variable before peut être utilisée pour exécuter un script Python pendant la construction de l'exercice.

La liste des langages utilisables actuellement est : c, cpp, python, java, ocaml
==
grader  =@ ./cgbasicgrader.py
builder =@ ./cgbuilder.py

@ ./utils/feedback2.py
@ ./utils/template.html
@ ./utils/langhandlers.py
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

before==
==