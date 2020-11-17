# CONTRACTS FOR FILES WHICH EXTENDS THIS TEMPLATE
#! linter:require:generate::str

extends = base.pl

#* Maximum number of attempts before showing the right answer.
maxattempt = 3

#XX this functionality has not been implemented yet - current behaviour is allow_reroll = True XX
#* When True display the reroll button and allow the student to reroll the exercice after tumeout
# TODO disable reroll is not implemented yet
allow_reroll = True

#* When True show a solution after timeout.
show_solution = False

#* Define a code editor component
editor =: CodeEditor

editor.code ==
Remplacer ce texte par votre réponse
==

editor.language = sql


#*===========================================================================
#* FEEDBACK VARIABLES
#*===========================================================================
#*  define feedback messages
#*  
#*  syntax: feedback_name = <p class="warning-state"> feedback message for the student </p>
#*      replace name with the name you want to use
#*      usual classes are "success-state", "warning-state" and "error-state"
#*
#*  usage:
#*  (1) in the evaluator section these variables are used to define the grade value
#*      grade = (score, feedback_nondef) 
#*  the feedback message will be automatically display to the student
#*
#*  (2) in html forms
#*


#* feedback in case of success
feedback_success = <p class="success-state"> Bravo! Vous avez réussi! </p>

#* feedback in case of error. {0} is replaced by the occured error
feedback_error = <p class="error-state">Votre réponse a provoqué une erreur.<br>{0}</p>

#* feedback in case of error. {0} is replaced by the occured error
feedback_fail = <p class="error-state">Votre réponse n'est pas correcte.</p>

#* feedback after timeout.
feedback_timeout =  <p class="warning-state"> Vous n'avez pas réussi l'exercice. Relisez votre cours avant de rééessayer.</p>

#* feedback before showing a solution
feedback_show_solution = <p class="warning-state">Voici une réponse possible à la question.<br></p>


#*===========================================================================
#* ADDITIONNAL HTML FORM
#*===========================================================================
#* override this key to change the text shown after timeout.
form_timeout== #|html|
{{ feedback_timeout }}
{% if show_solution %}
{{ feedback_show_solution }}
{{ solution }}
{% endif %}
== 


#*===========================================================================
#* override this key to change the instructions below inputbox for simple regex
form_instructions_sql_query== #|html|
<p>
Syntaxe: Attention de ne pas oublier le ; à la fin de votre requête
</p>
==

#*===========================================================================
# MANDATORY HTML FORM
#*===========================================================================

## exercise title -- should be override in the exercise file
title= PLEASE OVERRIDE THE KEY **title=** TO CHANGE THIS TEXT

## exercise instructions -- should be override in the exercise file
text= PLEASE OVERRIDE THE KEY **title=** TO CHANGE THIS TEXT

## In this form :
#   the editor for the student to provide an answer
#   define the submit and reroll buttons
#   some feedback html form
form== #|html|

<!-- TIMEOUT VIEW -->
{% if attempt >= maxattempt %}
{{ form_timeout }}
<!-- NORMAL VIEW -->
{% else %}
{{ editor|component }}
<br>
{{ form_instructions_sql_query }}
{% endif %}



<script>
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const submit = nodes.submit; // a reference to the submit button
        // hide submit button if timeout or success.
        submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);

        // disable some buttons
        const actions = nodes.actions;
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();

        // define reroll button
        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Relancer l'exercice
            </a>
        `);

    }
</script>
==

#*===========================================================================
# BEFORE
#*===========================================================================
before== #|py|
import random
import sqlite3

score = -1
attempt = 0
maxattempt = int(maxattempt)

allow_reroll = (allow_reroll == "True")
show_solution = (show_solution == "False")

# question par defaut si non définie dans le generate de l'exo
question = "question par defaut ?" 

# solution par defaut si non définie dans le generate de l'exo
solution = "42"

if 'generate' in globals():
    exec(generate)
==

#*===========================================================================
# EVALUATOR
#*===========================================================================
evaluator== #|py|

# TODO ajuster ici la fonction d'évaluation et la gestion du teste dessous
# Ca devrait peut-être dans un fichier .py en ajoutant le nom du fichier dans base.pl
# from monfichier import bla
# fonction d'évaluation

######

import sqlite3
fichier = open('script_soiree_lite.sql','r')
script = ""

for line in fichier:
    script += line

conn = sqlite3.connect(":memory:")

fichier.close()

cursor = conn.cursor()
cursor.executescript(script)
###########



def mafonctionevaluation(string_student_answer, solution):
    return string_student_answer == solution

def check_syntax(query, cursor):
    try:
        cursor.execute(query)
    except Exception as e:
        return (False, e)
    return (True, None)

def check_schema(query, answer, cursor):
    query = query.split(";")[0]
    answer = answer.split(";")[0]
    try:
        cursor.execute(f'with q1 as ({query}), q2 as ({answer}) select * from q1 EXCEPT select * from q2;')
    except sqlite3.OperationalError:
        e = []
        cursor.execute(answer)
        for desc in cursor.description:
            e.append(str(desc[0]))
        return (False, e)
    return (True, None)

def symmetric_difference(query, answer, cursor):
    query = query.split(";")[0]
    answer = answer.split(";")[0]
    over = None
    under = None

    cursor.execute(f'with q1 as ({query}), q2 as ({answer}) select * from q1 EXCEPT select * from q2;')
    ligne = cursor.fetchone()
    if ligne:
        over = str(ligne)
    cursor.execute(f'with q1 as ({query}), q2 as ({answer}) select * from q2 EXCEPT select * from q1;')
    ligne = cursor.fetchone()
    if ligne:
        under = str(ligne)
    if over or under:
        return (False, over, under)
    return (True, over, under)

# pour récupérer les erreurs
error = ""

## Get the student answer:
try:
    student_answer = editor
    student_query = editor.code
except Exception:
    error = "Syntax error"


## Check the student answer:
if error :
#    attempt += 1
    grade = (-1, feedback_error.format(error))
if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    score = 0
    grade = None
    (passed, message) = check_syntax(student_query, cursor)
    if not passed:
        grade = (0, f'<p class = \"error-state\"> {str(message)} </p>')
    
    if grade == None:
        (passed, message) = check_schema(student_query, solution, cursor)
        if not passed:
            grade = (0, f'<p class = \"error-state\"> Le schéma attendu est : {str(message)} </p>')
    
    if grade == None:
        (passed, over, under) = symmetric_difference(student_query, solution, cursor)
        if not passed:
            feedback = ""
            if over:
                feedback += f'Cette ligne ne devrait pas être dans la réponse : {str(over)}.'
            if under:
                if over:
                    feedback += "</br>"
                feedback += f'Cette ligne devrait être dans la réponse mais n\'y est pas : {str(under)}'
            grade = (0, f'<p class = \"error-state\"> {feedback} </br>  </p>')

    if grade == None:
        grade = (100, feedback_success)

    # noter la réponse de l'étudiant
    #if mafonctionevaluation(string_student_answer, solution):
    #    score = 100
    #    grade = (score, feedback_success)
    #else:
    #    attempt += 1
    #    grade=(score, feedback_fail)

==


































