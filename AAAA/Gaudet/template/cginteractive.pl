
# Ceci est un template pour faire des exercices avec la balise de correction cgtest
# Il s'agit d'une adaptation du template pltest
doc==
La liste des langages utilisables actuellement est : c, cpp, python, java
==
grader  =@ ./cginteractivegrader.py
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