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
feedback_success = <p> Bravo! Vous avez réussi! </p>

#* feedback in case of error. {0} is replaced by the occured error
feedback_error = <p class="error-state">Votre réponse a provoqué une erreur.<br>{0}</p>

#* feedback in case of error. {0} is replaced by the occured error
feedback_fail = <p class="error-state">Votre réponse n'est pas correcte. Réessayez.</p>

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

#*=========================================================================================
#* override this key to add content after feedback in case of good answer.
form_success== #|html|
{{ feedback_success }}
== 

#*=========================================================================================
#* override this key to add content after feedback in case of wrong answer.
form_fail== #|html|
{{ feedback_fail }}
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
text= PLEASE OVERRIDE THE KEY **text=** TO CHANGE THIS TEXT

## In this form :
#   the editor for the student to provide an answer
#   define the submit and reroll buttons
#   some feedback html form
form== #|html|

<!-- TIMEOUT VIEW -->
{% if attempt >= maxattempt %}
{{ form_timeout }}
<!-- SUCCESS VIEW -->
{% elif score == 100  %}
{{ form_success }}
<!-- ANSWER EDITOR  attempt 0-->
{% elif attempt == 0  %}
{{ editor|component }}
<br>
{{ form_instructions_sql_query }}
{% else %}
<!-- ANSWER EDITOR attempt>0 -->
{{ form_fail }}
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

score = -1
attempt = 0
maxattempt = int(maxattempt)

allow_reroll = (allow_reroll == "True")
show_solution = (show_solution == "False")


solution = 42



==

#*===========================================================================
# EVALUATOR
#*===========================================================================
evaluator== #|py|

# pour récupérer les erreurs
error = ""

## Get the student answer:
try:
    student_answer = editor
    string_student_answer = editor.code
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
    # noter la réponse de l'étudiant
    if string_student_answer == "youpi":
        score = 100
    else:
        attempt += 1
    #grade=(score, "")

==



























