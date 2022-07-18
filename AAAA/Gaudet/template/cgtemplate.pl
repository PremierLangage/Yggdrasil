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

La liste des langages utilisables actuellement est : c, cpp, python, java
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

# une interface standard d'exercice avec un editeur pour la réponse
form==
{{editor|component}}
==

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

# add languages to the CodeEditor
for lang in required_languages:
    editor.codes.append({
        'language': lang,
        'code': langhandlers.get_base_code(lang)
    })

# default language is first one in the list
editor.language = required_languages[0]

==

evaluator==#|py|

from cgtest import CodingGamesTestRunner
import langhandlers

student_code = response[editor.cid]['code']
if 'cgtest' not in globals() :
    print('cgtest missing, please specify tests to run', file=sys.stderr)
    sys.exit(1)

feedback = ''

# Get language used and the corresponding handler
lang = response[editor.cid]['language']
handler = langhandlers.get_language_handler(lang, student_code)

# Compilation
success, compile_feedback = handler.compile()
if not success:
    feedback += """<div style="border:1px solid black;padding:1%;margin:1%;background-color:Tomato;border-radius:4px;color:black;">
    La compilation/vérification du code a échoué<br>
    Voici le détail:
    <pre style="background: #DDD"><code>
    """
    feedback += compile_feedback
    feedback += "</code></pre><div>"
    score = 0

# Execution of tests
else:
    tester = CodingGamesTestRunner(cgtest, handler.exec_cmd)
    testname = testname if 'testname' in globals() else "Groupe de test 1"
    score, test_feedback = tester.runtests(testname)
    feedback += test_feedback

# Final feedback
grade = (score, feedback)
==