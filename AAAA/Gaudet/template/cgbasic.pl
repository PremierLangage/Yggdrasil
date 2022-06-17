# Date : 16/06/2022
# Auteur : Clément Gaudet

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
builder =@ ./cgbuilder.py

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

before==
==

evaluator==#|py|

import langhandlers, subprocess

student_code = response[editor.cid]['code']
if 'testcases' not in globals() :
    print('testcases missing, please specify tests to run', file=sys.stderr)
    sys.exit(1)

feedback = ''

# Get language used and the corresponding handler
lang = response[editor.cid]['language']
handler = langhandlers.get_language_handler(lang, student_code)

feedback = FeedBack(name="Tests")

# Compilation
success, compile_feedback = handler.compile()
if not success:
    feedback.addTestSyntaxError('Compilation', compile_feedback.replace('\n', '<br>'), 'La compilation du code a échoué')
    output(0, feedback.render(), context)
    sys.exit(1)

# Execution of tests
testcases = eval(testcases)
for test, want, name in testcases:
    try:
        proc = subprocess.run(self.run_cmd, input=test, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            text=True, timeout=1)
    except subprocess.TimeoutExpired:
        feedback.addTestError(name, "Erreur : l'exécution a pris trop de temps" , want)
    else:
        if proc.stdout.strip() == want.strip():
            feedback.addTestSuccess(name, output, want)
        else:
            feedback.addTestFailure(name, output, want)

# Final feedback
grade = (score, feedback)
==