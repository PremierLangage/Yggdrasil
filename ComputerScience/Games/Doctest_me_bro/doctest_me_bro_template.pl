#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
>>> votre premier test
La réponse attendue
==

before==
==

title = Doctest me bro template...

text==
Vous devez écraser ce texte en héritant du template....
==

form==
{{ editor|component }}
==

evaluator==#|python|
import subprocess

# extraction od bads and goods codes
g_code_keys = [k for k in globals().keys() if k.startswith('good')]
b_code_keys = [k for k in globals().keys() if k.startswith('bad')]

# Return the 
def nb_failled_test(code_key):
    """
    """
    f = open("doc_code.py", "w")
    src_code = globals()[code_key]
    code_text = (editor.code).replace('\n', '\n    ')
    if code_text[-1] == '\n':
        code_text = code_text[:-1]
    code_tested = src_code.replace("TEST_INCLUSION", code_text)
    f.write(code_tested)
    f.close()
    SP = subprocess.run(['python3', '-m', 'doctest', '-v', 'doc_code.py'], capture_output=True)
    out = SP.stdout.decode()
    lines = out.split('\n')
    while lines[-1] == '':
        lines = lines[:-1]
    lasts_lines = lines[-2:]
    return "<br />".join(lasts_lines)

# Resume good code doctests
if len(g_code_keys) > 1:
    str_g_c = "Bonnes propositions"
else:
    str_g_c = "Bonne proposition"
feedback = "<u><b>"+str_g_c+" :</b></u> On veut du vert!<br />"
feedback += "<br />".join([nb_failled_test(k) for k in g_code_keys])

# Resume bad code doctests
if len(b_code_keys) > 1:
    str_b_c = "Mauvaises propositions"
else:
    str_b_c = "Mauvaise proposition"
feedback += "<br /><br /><u><b>"+str_b_c+" :</b></u> On veut du rouge!<br />"
feedback += "<br />".join([nb_failled_test(k) for k in b_code_keys])

grade = (100, feedback)
==

