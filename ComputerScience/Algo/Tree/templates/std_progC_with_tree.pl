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

#*********************
#   MOTIVATIONS
#*********************
# The goal of this template is just customizing the classical template std_progC
# By adding tree in test and exemples. 
# This exemple ASSUME THAT STDIN OF TESTS WILL CONTAINS BINARY TREES

@ utils_binary_tree.py

extends=/ComputerScience/C/template/std_progC.pl

# viewer =: GraphDrawer
# from utils_binary_tree import random_binary_tree
# Tree_exo = random_binary_tree(int(taille_arbre), max_height=int(hauteur_max))[0]
# viewer.graph = Tree_exo.to_dot_code_BST_point()
# <style>
#  .graph-viewer-component {
#  pointer-events: none;
# }
# </style>

#
#  THE FOLLOWING IS C COPY PASTE OF EVALUATOR OF STD_PROGC.PL
#  with an inclusion of components to draw graphs...


evaluator==#|python|
import subprocess
from std_progC_utils import make_hide_block_on_click, terminal_code, subnlbybr
from utils_binary_tree import random_binary_tree
from components import GraphDrawer

test_viewer.graph = random_binary_tree(8)[0].to_dot_code_BST_point()

# principals signals
signals = {
    2: "SIGINT",
    3: "SIGQUIT",
    4: "SIGILL",
    6: "SIGABRT",
    8: "SIGFPE",
    9: "SIGKILL",
    11: "SIGSEGV",
    13: "SIGPIPE",
    14: "SIGALRM",
    15: "SIGTERM"
};

def control_returncode(rc, output):
    """
    Update the output of the terminal if UNIX did kill the process
    """
    if -rc in signals:
        output = "Process exited with UNIX signal ("+str(-rc)+") "+signals[-rc]
    else:
        output = "Process exited with UNIX signal ("+str(-rc)+")"

# Update nb attempt
nb_attempt += 1 # count each try....

# Pre-process before executing the checks
def prepare_code_to_file(src_code, filename):
    """
    Place inside file named `filename`
    """
    src_final = code_before
    src_final += "\n\n"
    src_final += src_code
    src_final += "\n\n"
    src_final += code_after
    src_final += "\n\n"
    with open(filename, 'w') as f:
        f.write(src_final)



# The two file to proceed the checks
prepare_code_to_file(editor.code, "src_student.c")
prepare_code_to_file(solution, "src_teacher.c")

def compile_source(src_name, prog_name, compiler, cflags=["-Wall", "-ansi"], libflags=[]):
    """
    compile the source in argument and return 
    """
    command_args = [compiler, src_name, "-o", prog_name] + cflags + libflags
    sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    spout = sp.stdout.decode()
    errout = sp.stderr.decode()
    returncode = sp.returncode
    return (returncode, spout, errout)

# Compile the teacher solution
compile_source("src_teacher.c", "teacher_prog", compiler, cflags, libflags)
# Compile the student proposition
returncode, spout, errout = compile_source("src_student.c", "student_prog", compiler, cflags, libflags)

# Compilation ok
if len(spout) + len(errout) == 0:
    grade_compil = 100
    text_compil = 'Compilation réussie'
    compil_state = 'success'
    class_state = 'success'
else:
    # Compilation Aborted
    if "error:" in errout:
        grade_compil = 0
        text_compil = 'Compilation échouée'
        compil_state = 'error'
        class_state = 'error'
    # So there must have some warning
    else:
        nb_w_compil = (spout+errout).count('warning')
        grade_compil = max(0, 100 - (nb_w_compil*10) )
        text_compil = 'Compilation réussie avec ' + str(nb_w_compil) + ' warning'
        if nb_w_compil > 1:
            text_compil += 's'
        compil_state = 'warning'
        class_state = 'warning'

if "taboo" in globals(): 
    import re
    pat = re.compile(taboo, re.IGNORECASE)
    if pat.search(editor.code):
        compil_state = 'taboo-error'
        class_state = 'error'
        text_compil = 'Compilation échouée non respect du taboo : '+taboo+' '
        grade_compil = 0

# begin of feedback
feedback = '<p style="margin-bottom: 5px;"><b><u>Compilation :</u> ' + str(grade_compil) + '%</b> '
if compil_state != 'success':
    feedback += '(cliquer au dessous pour dérouler les détails)</p>'
feedback += '<div class="' + class_state + '-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
if compil_state == 'taboo-error':
    feedback += "<b>Refus de compilation :</b> non respect du taboo : "+taboo
elif compil_state != 'success':
    feedback += make_hide_block_on_click("compil_ans", text_compil + ' avec flags ' + ' '.join(cflags), terminal_code(spout+errout), "")
else:
    feedback += make_hide_block_on_click("compil_ans", text_compil + ' avec flags ' + ' '.join(cflags), "C'était parfait, le compilateur n'a rien dit...", "")
feedback += '</div>'

# We replace the compil state to error to disable tests
if compil_state == 'taboo-error':
    compil_state = 'error'

# Tests
nb_good = 0
nb_bad = 0
grade_checks = 0

feedback_checks = ""

# data test generation : must be in a separate place
# since it need a new eval at each attempt to be really
# random !!!
from random import *
from utils_binary_tree import random_binary_tree, binary_tree_from_code
checks_data = eval(checks_args_stdin)

if compil_state != 'error':
    for test_c in checks_data:
        f_in=open("stdin_content", "w")
        f_in.write(test_c[2])
        f_in.close()
        # Use the teacher solution to generated expected output of the test
        command_args = " ".join(["./teacher_prog"] + list(map(lambda x: "'"+x+"'", test_c[1])) )
        sp = subprocess.run(command_args, stdin=open("stdin_content", "r"), stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, timeout=1)
        try: 
            expected_ouput = sp.stdout.decode() + sp.stderr.decode()
        except:
            expected_ouput = "Impossible de décoder la sortie standard"
        if -sp.returncode in signals:
            expected_ouput += "Process exited with UNIX signal ("+str(-sp.returncode)+") "+signals[-sp.returncode]
        elif sp.returncode < 0:
            expected_ouput += "Process exited with UNIX signal ("+str(-sp.returncode)+")"

        # Now execute the student programm
        command_args = " ".join(["./student_prog"] + list(map(lambda x: "'"+x+"'", test_c[1])) )
        sp = subprocess.run(command_args, stdin=open("stdin_content", "r"), stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, timeout=1)
        try: 
            spout = sp.stdout.decode() + sp.stderr.decode()
        except:
            spout = "Impossible de décoder la sortie standard"
        if -sp.returncode in signals:
            spout += "Processus terminé avec le signal UNIX ("+str(-sp.returncode)+") "+signals[-sp.returncode]
        elif sp.returncode < 0:
            spout += "Processus terminé avec le signal UNIX ("+str(-sp.returncode)+")"

        if spout == expected_ouput:
            nb_good += 1
            feedback_checks += '<div class="success-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += expected_ouput
            if len(test_c[2]) > 0:
                stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
                stdin_explain += subnlbybr(test_c[2])
                if test_c[2][-1] != '\n':
                    stdin_explain += "<br />"

                # Tree inscrustation
                Tree_exo = binary_tree_from_code(test_c[2])
                viewer = GraphDrawer()
                viewer.graph = Tree_exo.to_dot_code_BST_point()
                stdin_explain += " <style>\n  .graph-viewer-component {\n  pointer-events: none;\n  }\n</style>"
                stdin_explain += f" \n\n <c-graph-viewer graph='{viewer.graph}'></c-graph-viewer> \n\n"
            else:
                stdin_explain = ""
            feedback_checks += make_hide_block_on_click("details_check"+str(nb_good+nb_bad), test_c[0], stdin_explain + terminal_code(terminal_log), "")
            feedback_checks += '</div>'
        else:
            nb_bad += 1
            feedback_checks += '<div class="error-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
            term_tot = "Attendu : <br />"
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += expected_ouput
            if len(test_c[2]) > 0:
                stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
                stdin_explain += subnlbybr(test_c[2])
                if test_c[2][-1] != '\n':
                    stdin_explain += "<br />"
                
                # Tree inscrustation
                Tree_exo = binary_tree_from_code(test_c[2])
                viewer = GraphDrawer()
                viewer.graph = Tree_exo.to_dot_code_BST_point()
                stdin_explain += " <style>\n  .graph-viewer-component {\n  pointer-events: none;\n  }\n</style>"
                stdin_explain += f" \n\n <c-graph-viewer graph='{viewer.graph}'></c-graph-viewer> \n\n"

            else:
                stdin_explain = ""
            term_tot += terminal_code(terminal_log)
            term_tot += "Obtenu : <br />"
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += spout
            term_tot += terminal_code(terminal_log)
            feedback_checks += make_hide_block_on_click("details_check"+str(nb_good+nb_bad), test_c[0], stdin_explain + term_tot, "")
            feedback_checks += '</div>'

    grade_checks = min([((nb_good*100) // (nb_good+nb_bad)) , (100 // (2**nb_bad))])
feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Tests :</u> ' + str(grade_checks) + '%</b> (cliquer sur les tests pour afficher/réduire leurs détails)</p>'

if compil_state == 'error':
    feedback += '<div class="error-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += '<b>Erreur à la compilation :</b> Pas de test lancé</div>'
else:
    feedback += feedback_checks

grade_attempt = 50 + (200 // (3+nb_attempt))

feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Efficacité :</u> ' + str(grade_attempt) + '%</b></p>'

if nb_attempt == 1:
    feedback += '<div class="success-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += '1 tentative</div>'
    all_grade = [(grade_compil * grade_checks * grade_attempt) // 10000]
else:
    feedback += '<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += str(nb_attempt)+' tentatives</div>'
    all_grade.append((grade_compil * grade_checks * grade_attempt) // 10000)

# overall grade !
feedback = '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Note actuelle :</u> ' + str(max(all_grade)) + '/100</b></p>' + feedback

grade=((grade_compil * grade_checks * grade_attempt) // 10000, feedback)
==



