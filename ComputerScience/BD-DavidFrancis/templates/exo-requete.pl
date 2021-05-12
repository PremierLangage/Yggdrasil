# CONTRACTS FOR FILES WHICH EXTENDS THIS TEMPLATE
#! linter:require:generate::str

extends = base.pl

#* Maximum number of attempts before showing the right answer.
#maxattempt = 3

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
feedback_success ==
 <p class="success-state"> Bravo! Vous avez réussi! </p>
==
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
#form_schema== #|html|
# {{schema |safe}}
#==

#*===========================================================================
# MANDATORY HTML FORM
#*===========================================================================

## exercise title -- should be override in the exercise file
title= PLEASE OVERRIDE THE KEY **title=** TO CHANGE THIS TEXT

#* Texte de l'énoncé
# ---
text== #|html|
<p><strong>On considère le schéma ci-dessous </strong><br>
 {{schema |safe}}
 <br>
 <strong>Ecrivez une requete SQL pour récupérer l'information suivante:</strong><br>
 {{ question }} <br> </p>

==
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
{% endif %}



<script>
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const submit = nodes.submit; // a reference to the submit button
        // hide submit button if timeout or success.
        //submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);
        // hide submit button if success.
        submit.attr("disabled", {{ score }} == 100);

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
#attempt = 0
#maxattempt = int(maxattempt)

allow_reroll = (allow_reroll == "True")
show_solution = (show_solution == "True")

# définir ordered = True dans le generate de l'exo pour tester si les lignes sont dans le bon ordre
ordered = False

# définir numbered = True dans le generate de l'exo pour tester l'égalité du nb de tuples entre la solution et la requête de l'étudiant.
numbered = False

if 'generate' in globals():
    exec(generate)

# récupération schema à partir du fichier schema_bd
fichier = open(schema_bd,'r')
schema = ""
for line in fichier:
    schema += line
fichier.close()
schema = schema + "<br>"

==

#*===========================================================================
# EVALUATOR
#*===========================================================================
evaluator== #|py|

######
import sqlite3
fichier = open(fichier_bd,'r')
script = ""

for line in fichier:
    script += line

conn = sqlite3.connect(":memory:")

fichier.close()

cursor = conn.cursor()
cursor.executescript(script)
###########


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

def check_rowcount(query, answer, cursor):
    query = query.split(";")[0]
    answer = answer.split(";")[0]

    cursor.execute(f'select count(*) from ({query});')
    rowcount_query = int(cursor.fetchone()[0])

    cursor.execute(f'select count(*) from ({answer});')
    rowcount_answer = int(cursor.fetchone()[0])

    return (rowcount_query == rowcount_answer, rowcount_answer, rowcount_query)

def check_order(query, answer, cursor1, cursor2):
    query = query.split(";")[0]
    answer = answer.split(";")[0]

    passed = True
    cursor1.execute(query)
    cursor2.execute(answer)

    ligne1 = True

    while passed and ligne1:
        ligne1 = cursor1.fetchone()
        ligne2 = cursor2.fetchone()
        if ligne1 != ligne2:
            passed = False

    return passed
    

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
#if attempt >= maxattempt: # timeout
#    grade = (score, feedback_timeout)
else:
    score = 0
    grade = None
    (passed, message) = check_syntax(student_query, cursor)
    if not passed:
        grade = (0, f'<p class = \"error-state\"> {str(message)} </p>')
    
    if grade == None:
        (passed, message) = check_schema(student_query, solution, cursor)
        if not passed:
            grade = (0, f'<p class = \"error-state\"> Le schéma attendu pour la réponse est : {str(message)} </p>')
    
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
    
    if grade == None and numbered:
        (passed, nb_solution, nb_answer) = check_rowcount(student_query, solution, cursor)
        if not passed:
            if nb_solution < nb_answer:
                feedback = f'Les valeurs renvoyées par la requête sont correctes mais il y a trop de lignes (doublons).'
            else :
                feedback = f'Les valeurs renvoyées par la requête sont correctes mais il manque des occurrences de certaines lignes.'
            grade = (0, f'<p class = \"error-state\"> {feedback} </br>  </p>')
                 
    if grade == None and ordered:
        cursor2 = conn.cursor()
        passed = check_order(student_query, solution, cursor, cursor2)
        if not passed:
            grade = (0, '<p class = "error-state"> Le contenu de la réponse est correct, mais les lignes sont dans le mauvais ordre.</p>')


    if grade == None:
        grade = (100, feedback_success)
        #grade = (100, feedback_success + f'<p class = \"warning-state\"> ordered : {str(ordered)} numbered : {str(numbered)}</p>')


==
















































