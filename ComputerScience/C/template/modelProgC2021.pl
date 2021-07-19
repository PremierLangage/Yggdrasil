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

#*****************************************************************************
#
# This is a re-implementation of the standard template of programming exercice 
# of C language implemented after the experience of 2019-2020 during 
# summer 2020
#
# Change :
#    * tests has been renamed to checks_args_stdin
#    * use subprocess instead of use directly os and sys
#    * better use of css/javascript to display/hide feedback
#
#*****************************************************************************

#*****************************************************************************
# Summer 2021 : DR adding a editor for the text part 
#*****************************************************************************


@ std_progC_utils.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/bbefore.py

title=Standard C Programming exercise template (summer 2020)

text==
**This text shoud be overwrited when inheriting from the Standard C 
Programming exercise template.**


In this template example, we ask the user to programm a squarre function.
==

editor =: CodeEditor
editor.theme = dark
editor.language = C
editor.code ==
/* ecrire votre code ICI */
==

editor1 =: CodeEditor
editor1.theme = light
editor1.language = python




editor.code==#|c|
/* write your code here */
/* For testing purpose, we did place here a square function on integers... */
int carre(int n){
    return n*n;
}
==

before1 ==#|python|
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=[]

if "taboo" in globals(): 
    text+='<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    text+="<b>Taboo :</b> attention, il y aura un refus de compilation si vous proposez un code qui utilise les mots suivants (ne les mentionnez pas ni en fonction, ni en nom de variable) : "
    text+=str(taboo)
    text+='</div> <br />\n'


text+=" {{ editor1|component }}  {{ editor|component }} "
==

# tests are placed inside a list stored in variable : checks_args_stdin
# each test must have the following shape :
# ["name of the test", [list of arguments of the test], stdin of the test ]
# During the test execution, subprocess will execute :
# ./prog [list of argument]  
# and a tube will place the content stdin inside the standard input of the
# process...
checks_args_stdin==
 [["Premier test exemple (1 et 1)", ["1"], "1"],
 ["Second test exemple (12 et -7)", ["12"], "-7"],
 ["Troisième test aléatoire", [str(randint(-100,100))], str(randint(-100,100)) ],
 ["Quatrième test aléatoire", [str(randint(-100,100))], str(randint(-100,100)) ],
 ["Cinquième test aléatoire lui aussi", [str(randint(-100,100))], str(randint(-100,100)) ] ]
==

form==

==

code_before==#|c|

==

solution==#|c|
int carre(int p){
    return p*p;
}
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    int i, j;
    
    i = atoi(argv[1]);
    scanf("%d", &j);

    printf("Le carré de i = %d est %d\n", i, carre(i));
    printf("Le carré de j = %d est %d\n", j, carre(j));
    return 0;
}
==

evaluator==#|python|
import subprocess
from std_progC_utils import make_hide_block_on_click, terminal_code, subnlbybr

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
            expected_ouput = sp.stdout.decode().replace(' ', '&nbsp;') + sp.stderr.decode().replace(' ', '&nbsp;')
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
            spout = sp.stdout.decode().replace(' ', '&nbsp;') + sp.stderr.decode().replace(' ', '&nbsp;')
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

# tests.test1.editor.code==
# ==
# tests.test1.editor.code = int carre(int p){ return p*p; }
# tests.test1.editor.code = "int carre(int p){ return p*p; }"
# tests.test1.editor.code = 'int carre(int p){ return p*p; }'
# tests.test1.editor.code = solution
# tests.test1.grade = 100








