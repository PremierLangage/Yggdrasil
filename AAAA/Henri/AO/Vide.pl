@ /ComputerScience/C/template/std_progC_utils.py
@ nasmtools.py
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py

editor =: CodeEditor
editor.theme=dark
editor.language=Assembly

editor.code==#|asm|
==

student_source = main

code_after==#|c|
==

code_before==#|c|
==

headers % {}
sources % {}

# Correction
sources.main==
==

checks_args_stdin==#|python|
[
    ["Exécution simple", [], ""]
]
==

form ==
{{ editor|component }}
==

evaluator==#|python|
import html

from std_progC_utils import make_hide_block_on_click
from nasmtools import Source, Program

# Create files and build files
srcs = {
    src: Source(src + '.asm', sources[src]).write()
    for src in sources
}

for h in headers:
    Source(h + '.inc', headers[h]).write()

for src in srcs:
    assert srcs[src].build(), srcs[src].build().errout

# Compile the teacher solution
pgr_teacher = Program("teacher_prog", srcs.values())
assert pgr_teacher.link(), "La version du prof ne link pas...: " + pgr_teacher.link().errout

# Compile the student proposition
src_student = Source("src_student.asm", editor.code, code_before, code_after).write()
pgr_student = Program(
    "student_prog", 
    [src_student] + [srcs[s] for s in srcs if s != student_source]
)
student_compile = src_student.build() * pgr_student.link()

grade_compil = student_compile.grade()

# Tests
nb_good = 0
nb_bad = 0
grade_checks = 0

feedback_checks = ""

# data test generation : must be in a separate place
# since it need a new eval at each attempt to be really
# random !!!
from random import *
checks_data = eval(checks_args_stdin)

if not student_compile.error():
    for test_c in checks_data:
        f_in=open("stdin_content", "w")
        f_in.write(test_c[2])
        f_in.close()
        # Use the teacher solution to generated expected output of the test
        expected_ouput = pgr_teacher.run(test_c[1], io.StringIO(test_c[2]))

        # Now execute the student programm
        spout = pgr_student.run(test_c[1], io.StringIO(test_c[2]))

        terminal_log = (
              "<pre>" 
            + html.escape("Platon@debian~$> ./student_prog " + " ".join(test_c[1])) + "\n"
            + html.escape(expected_ouput)
            + "</pre>"
        )
        
        stdin_explain = ""
        if len(test_c[2]) > 0:
            stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
            stdin_explain += "<pre>" + html.escape(test_c[2]) + "</pre>"

        if spout == expected_ouput:
            nb_good += 1
            feedback_checks = (
                  '<div class="success-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
                + make_hide_block_on_click(
                    "details_check"+str(nb_good+nb_bad), 
                    test_c[0], 
                    stdin_explain + terminal_log, 
                    ""
                )
                + '</div>'
            )
        else:
            nb_bad += 1
            feedback_checks = (
                  '<div class="error-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
                + make_hide_block_on_click(
                    "details_check"+str(nb_good+nb_bad), 
                    test_c[0], 
                    stdin_explain
                    + "Attendu: " + terminal_log
                    + "Obtenu: " + (
                        "<pre>" 
                        + html.escape("Platon@debian~$> ./student_prog " + " ".join(test_c[1])) + "\n"
                        + html.escape(spout)
                        + "</pre>"
                    ), 
                    ""
                )
                + '</div>'
            )

    grade_checks = min([((nb_good*100) // (nb_good+nb_bad)) , (100 // (2**nb_bad))])

feedback = student_compile.formatted_feedback()
feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Tests :</u> ' + str(grade_checks) + '%</b> (cliquer sur les tests pour afficher/réduire leurs détails)</p>'

if student_compile.error():
    feedback += '<div class="error-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += '<b>Erreur à la compilation :</b> Pas de test lancé</div>'
else:
    feedback += feedback_checks

# overall grade !
feedback = '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Note actuelle :</u> ' + str((grade_compil * grade_checks ) // 100) + '/100</b></p>' + feedback

grade=((grade_compil * grade_checks ) // 100, feedback)
==