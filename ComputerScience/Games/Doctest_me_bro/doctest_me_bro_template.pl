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

# 
def nb_failled_test(code_key):
    """
    """
    f = open("doc_code.py", "w")
    src_code = globals()[code_key]
    code_text = '    '+(editor.code).replace('\n', '    ')
    code_tested = src_code.replace("TEST_INCLUSION", code_text)
    f.write(code_tested)
    f.close()
    SP = subprocess.run(['python3', '-m', 'doctest', '-v', 'doc_code.py'], capture_output=True)
    out = SP.stdout.decode()
    return out.replace('\n', '<br />')

feedback = editor.code + "<br />".join([nb_failled_test(k) for k in g_code_keys]) + "<br />".join([nb_failled_test(k) for k in b_code_keys])

grade = (100, feedback)
==

