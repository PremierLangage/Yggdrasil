# Ceci est un template pour faire des exercices avec la balise de correction cgtest
# Il s'agit d'une adaptation du template pltest
doc==
Ce template permet de faire des exercices pouvant être résolu avec différents langages, au choix
de l'étudiant. Les tests sont écrits comme des doctests. 
Une fonction spéciale 'test' est fournie qui prend en argument une chaine de caractères qui sera
passée dans l'entrée standard du programme écrit par l'étudiant et qui renvoie ce qui est mis sur
la sortie standard et erreur par celui-ci.

La batterie de test est à mettre dans la variable cgtest

Par exemple:
    cgtest==
    >>> test('1\n2\n') # Somme simple
    '3'
    >>> test('-6\n4\n') # Somme avec négatif
    '-2'
    >>> from random import randint; a = randint(0, 100); test('2\n' + str(a) + '\n') == str(2 + a) # Test aléatoire
    True
    ==

Les langages autorisés sont à indiquer dans la variable language comme ceci:
    language ==
    python
    c
    ==

La liste des langages utilisables actuellement est : c, python, java
==
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ ./utils/cgtest.py
@ ./utils/feedback2.py
@ ./utils/template.html
@ ./utils/langhandlers.py
@ /utils/sandboxio.py

settings.allow_reroll = 1

editor =: CodeEditor
editor.theme = dark
editor.height = 500px

languages==
==

before==#|py|

import langhandlers
editor.codes = []

available_languages = langhandlers.get_available_languages()

# get required language, if none then all languages proposed by default
if languages.strip() == '':
    required_languages = available_languages
else:
    required_languages = languages.split('\n')

for lang in required_languages:
    editor.codes.append({
        'language': lang,
        'code': langhandlers.get_base_code(lang)
    })
editor.language = required_languages[0]

==

evaluator==#|py|

from cgtest import CodingGamesTestRunner
import langhandlers



==

# une interface standard d'exercice avec un editeur pour la réponse
form==
{{editor|component}}
==