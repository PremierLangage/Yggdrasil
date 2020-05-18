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

style_add==
<style>
#cercle_vert {
    width: 1em;
    height: 1em;
    border-radius: 0.5em;
    background: #CCFFCC;
    border: 1px solid black;
}
#cercle_rouge {
    width: 1em;
    height: 1em;
    border-radius: 0.5em;
    background: #FFCCCC;
    border: 1px solid black;
}
</style>
==

evaluator==#|python|
import subprocess

# extraction od bads and goods codes
g_code_keys = [k for k in globals().keys() if k.startswith('good_code')]
b_code_keys = [k for k in globals().keys() if k.startswith('bad_code')]

# Return two string summarizing doctest status...
def nb_failled_test(code_key):
    """
    """
    src_code = globals()[code_key]
    code_text = (editor.code).replace('\n', '\n    ')
    if len(code_text) > 0 and code_text[-1] == '\n':
        code_text = code_text[:-1]
    code_tested = src_code.replace("TEST_INCLUSION", code_text)
    # we write the function with its test inside a file
    with open(code_key+'.py', 'w') as f:
        f.write(code_tested)
    SP = subprocess.run(['python3', '-m', 'doctest', '-v', code_key+'.py'], capture_output=True)
    out = SP.stdout.decode()
    lines = out.split('\n')
    while lines[-1] == '':
        lines = lines[:-1]
    lasts_lines = lines[-2:]
    return ("<br />".join(lasts_lines), "<b>"+code_key+"</b><br /><pre>"+code_tested+"</pre><br />"+out)

g_with_fail = 0
b_with_no_fail = 0
feedback = style_add

# Resume good code doctests
if len(g_code_keys) > 1:
    str_g_c = "Bonnes propositions"
else:
    str_g_c = "Bonne proposition"
feedback += "<u><b>"+str_g_c+" :</b></u> On veut du vert!<br />"

feedback2 = ""
for k in g_code_keys:
    dt_res, out = nb_failled_test(k)
    if " 0 failed." not in dt_res:
        g_with_fail += 1
        feedback += '<div id="cercle_rouge" style="display: inline-block"></div> '
    else:
        feedback += '<div id="cercle_vert" style="display: inline-block"></div> '
    feedback += '<div style="display: inline">' + dt_res + '</div>'
    feedback += "<br />"
    feedback2 += '<br />' + out.replace('\n', '<br />') + '<br />'

# Resume bad code doctests
if len(b_code_keys) > 1:
    str_b_c = "Mauvaises propositions"
else:
    str_b_c = "Mauvaise proposition"
feedback += "<br /><u><b>"+str_b_c+" :</b></u> On veut du rouge!<br />"

for k in b_code_keys:
    dt_res, out = nb_failled_test(k)
    if " 0 failed." not in dt_res:
        feedback += '<div id="cercle_rouge" style="display: inline-block"></div> '
    else:
        b_with_no_fail += 1
        feedback += '<div id="cercle_vert" style="display: inline-block"></div> '
    feedback += '<div style="display: inline">' + dt_res + '</div>'
    feedback += "<br />"
    feedback2 += '<br />' + out.replace('\n', '<br />') + '<br />'

# last feedback recommandation : displayed at the top
if g_with_fail > 0 :
    feedback = '<span class="error-state animated pulse infinite">Vos tests sont incohérents car il existe au moins une bonne réponse ne passant pas tous vos tests.</span><br /><br />' + feedback
    note_finale = 0
else:
    if b_with_no_fail > 0:
        feedback = '<span class="error-state animated pulse infinite">Il manque des tests car il existe au moins une mauvaise réponse passant tous vos tests.</span><br /><br />' + feedback
        note_finale = (100*(len(b_code_keys) - b_with_no_fail)) // len(b_code_keys)
    else:
        feedback = '<span class="success-state animated pulse infinite">Bravo, vos tests discriminent correctement les bons et mauvais codes.</span><br /><br />' + feedback
        note_finale = 100

# grade = (100, feedback+feedback2) # for debuging
grade = (note_finale, feedback)
==


