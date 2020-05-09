# CONTRACTS FOR FILES WHICH EXTENDS THIS TEMPLATE
#! linter:require:generate::str

extends = base.pl

#*===========================================================================
##TODO
# + implement disable reroll cf flag allow_reroll
# + implement evaluator for eval_type values isomorph and same_as
# + so far solution is always an automaton (possibly defined from a regex)
#   this automaton can be shown to the student after timeout (flag show_solution)
#   We do not deal other type of solution such as regex for example this could be
#   changed either by asking the solution to be of answer type of create a regex
#   from the automaton solution in case of regex expected answer.
# + simple regex parsor should be in automaton and not in generator.py
# + It seems impossible to define a second drawer from the solution on top of enonce
#   I am using viewer but it gives the minimal dfa
# + is it ok to have the solution in a viewer component (see the remark in 
#   the documentation about what is visible to the student in the web page info
# + remove link to unused files in base.pl
#*===========================================================================

#* Maximum number of attempts before showing the right answer.
maxattempt = 3

#XX this functionality has not been implemented yet - current behaviour is allow_reroll = True XX
#* When True display the reroll button and allow the student to reroll the exercice after tumeout
# TODO disable reroll is not implemented yet
allow_reroll = True

#* When True show a solution after timeout.
show_solution = False

#* define what type of answer is expected from the student
#   automaton -- automaton -> add automaton editor in the form
#   simple-regex -- simple rexgex -> add inputbox in the form
answer_type = automaton

#* define what is expected for the student answer to be correct
# 	equi_lang -- the automaton/regex of the student is equivalent to the langage described in answer
#	mini_auto -- the automaton of the student is the minimal complete dfa corresponding to the langage described in answer
#	isomorph -- the automaton of the student is isomorph to the automaton given in answer
#	same_as --  the automaton of the student is the same (including states names) as the automaton given in answer
eval_type = equi_lang

#XXX
#* Define an inputbox component
inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.maxlength = 50
inputbox.appearance = outline


#XXX
#* Define an automaton editor component and a drawer component
# done in "before section" -- make it uniform with inputbox definition

#*===========================================================================
# GENERATE
#*===========================================================================
#*
#*  generate must define the variable
#*   
#*  **solution** => an automaton in one of the accepted formats (string, regex, object...)
#*               This automaton is considered as the solution and will be used in the evaluator section
#*               and can be presented to the student in case of timeout depending on the flag show_solution
#*  Examples:
#*
#*  generate== #|py|
#*  solution = Automaton.parse('(ab)*')
#*  ==
#*
#*  generate== #|py|
#*  solution = '''
#*      #states
#*       S0
#*       S1
#*       #initials
#*       S0
#*       #accepting
#*       S1
#*       #alphabet
#*       a
#*       b
#*       #transitions
#*       S0:a>S1
#*       S1:b>S0
#*  '''
#*==


generate % null

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

#* feedback after a good answer.
feedback_match = <p class="success-state">Bravo! C'est une bonne réponse.</p>

#* feedback after a bad answer.
feedback_nomatch = <p class="error-state">Votre réponse n'est pas correcte.</p>

#* feedback after timeout.
feedback_timeout =  <p class="warning-state"> Vous n'avez pas réussi l'exercice.</p>

#* feedback before showing a solution
feedback_show_solution = <p class="warning-state">L'automate suivant était une réponse possible à cette question.</p>

#* feedback in case of syntax error. {0} is replaced by the occured error
feedback_syntax_error = <p class="warning-state">{0}</p>
#feedback_syntax_error = <p class="warning-state">Erreur de syntaxe </p>

#* feedback in case evaluation fonction is not defined
feedback_nondef = <p class="warning-state">La fonction de correction de ce type d'exercice n'est pas définie</p>

#* feedback when the student automaton corresponds to the langage but non deterministic or not complete.
feedback_nondet = <p class="warning-state">L'automate correspond au langage mais n'est pas deterministe complet.</p>

#* feedback when the student automaton is a complete dfa for the langage but not the minimal one.
#feedback_nomini = <p class="warning-state">Votre automate est deterministe complet et correspond au langage mais il n'est pas minimal {0} vs {1}.</p>
feedback_nomini = <p class="warning-state">Votre automate est deterministe complet et correspond au langage mais il n'est pas minimal.{0}</p>


#* feedback when the student automaton corresponds to the langage but is not equal to the expected answer. (used in exercice mode same_as)
feedback_equi_not_identical = <p class="warning-state">Votre automate correspond au langage mais n'est pas la réponse attendue.</p>

#*===========================================================================
#* ADDITIONNAL HTML FORM
#*===========================================================================
#* override this key to change the instructions below the automaton editor.
form_instructions_automaton_editor== #|html|
<p>
    <ul>
        <li> Pour créer un nouvel état, double clic gauche. Utilisez les boutons pour changer le type de votre état.<br>
        <i>Ne renommez pas les états, il semblerait qu'il y ait encore qq bugs...</i>
        </li>
        <li>
        Pour ajouter une transition cliquer sur le point orange de l'état de départ
        et tirer votre transition jusqu'à l'état d'arrivée.
        Pour ajuster la lettre étiquettant de la transition, cliquer sur l'étiquette et choisir "changer "etiquette".
        </li>
    </ul>
</p>
==

#*===========================================================================
#* override this key to change the instructions below inputbox for simple regex
form_instructions_regex== #|html|
<p>
Syntaxe: ( ), . concaténation, + union, * étoile de Kleene, le symbole € peut être utiliséé à la place de ε.<br>
<strong>Attention, pas de racourci pour la répétition L⁴ ou L⁺ ne sont pas autorisés.</strong><br>
Vous pouvez ommettre le symbole de concaténation
</p>
==

#*===========================================================================
#* override this key to change the text shown after timeout.
form_timeout== #|html|
{% if show_solution %}
{{ feedback_show_solution }}
{{ solution_view|component }}
{% endif %}
== 

#*=========================================================================================
#* override this key to add content after feedback in case of good answer.
form_success== #|html|
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
{% endif %}

<!-- SUCCESS VIEW -->
{% if score == 100  %}
{{ form_success }}
{% endif %}

<!-- AUTOMATON ANSWER EDITOR -->
{% if answer_type == "automaton"  %}
{{ editor|component }}
<br>
{{ form_instructions_automaton_editor }}
{% endif %}

<!-- REGEX ANSWER INPUTBOX -->
{% if answer_type == "simple-regex"  %}
{{ inputbox|component}}
{{ form_instructions_regex }}
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

from automaton import Automaton
from generator import Generator

score = -1
attempt = 0
maxattempt = int(maxattempt)

allow_reroll = (allow_reroll == "True")
show_solution = (show_solution == "True")
answer_type = str(answer_type)

# CREATION OF THE AUTOMATON EDITOR
# THE PROPERTIES OF THE EDITOR CAN BE CHANGED INSIDE 'generate' SCRIPT
editor = Automaton.editor()
editor.debug = False
editor.editorHeight = "500px"


# CREATION OF THE REGEX INPUT BOX
# THE PROPERTIES OF THE EDITOR CAN BE CHANGED INSIDE 'generate' SCRIPT
# XXX mis en haut mais devrait probablement être écrit autrement
# inputbox =: Input
# inputbox.type = text
# inputbox.placeholder = Answer
# inputbox.maxlength = 50
# inputbox.appearance = outline

if 'generate' not in globals():
    raise Exception('You must define a script "generate"')

exec(generate)

if 'solution' not in globals():
    raise Exception('The script "generate" must define a variable "solution" which is an automaton')

# CREATION OF THE AUTOMATON VIEWER
# solution_view automaton viewer that containts the solution
solution_view = Automaton.viewer(solution)
#solution_view.automaton = solution

==

#*===========================================================================
# EVALUATOR
#*===========================================================================
evaluator== #|py|
from automaton import Automaton
from generator import Generator

# pour récupérer les erreurs
error = ""

## Get the student answer:
if answer_type == "automaton" :
    string_student_answer = editor.automaton
    student_answer = editor
    info_student_answer , _ = Automaton.properties(editor)
    # Automaton.properties will detect if editor is the an instance of AutomatonEditor
    # and call editor_properties to not alterate the student automaton
    # Bof Bof à ajuster quand on aura le nouvelle lib
    # Je préfèrerai un flag pour ne jamais alterer l'automate y compris celui de l'énoncé ou de solution
elif answer_type == "simple-regex" :
    try:
        student_answer = Automaton.from_regex(inputbox.value, simple=True) # raise exception if not valid
    except Exception as e:
#        error = str(e)
        error = "Syntax error"
else :
    error = "type de réponse non défini"

## Check the student answer:
if error :
#    attempt += 1
    grade = (-1, feedback_syntax_error.format(error))

    ## eval_type  possible values:
    # 	equi_lang -- the automaton/regex of the student is equivalent to the langage described in answer
    #	mini_auto -- the automaton of the student is the minimal complete dfa corresponding to the langage described in answer
    #	isomorph -- the automaton of the student is isomorph to the automaton given in answer
    #	same_as --  the automaton of the student is the same (including states names) as the automaton given in answer

# equi_lang -- success iff the automaton/regex of the student is equivalent to the langage described in answer
elif eval_type == "equi_lang" : 
    if attempt >= maxattempt: # timeout
           grade = (score, feedback_timeout)
    else:
        attempt += 1
        ## Il faudra peut-être ajuster si solution n'est plus un forcément un dfa
        match, error = Automaton.compare(solution, student_answer)
        if  attempt >= maxattempt and (error or not match): # error or no match after timeout
            grade = (score, feedback_timeout)
        elif error:
            grade = (-1, feedback_syntax_error.format(error))
        elif match is True:
            score = 100
            grade = (score, feedback_match)
        else:
            score = 0
            grade=(score, feedback_nomatch)

# mini_auto -- success iff the automaton of the student is the minimal complete dfa corresponding to the langage described in answer
elif answer_type == "automaton" and eval_type == "mini_auto" : 
    if attempt >= maxattempt: # timeout
        grade = (score, feedback_timeout)
    else:
        attempt += 1
        ## Il faudra peut-être ajuster si solution n'est plus un forcément un dfa
        match, error = Automaton.compare(solution, student_answer)
        info_solution , _ = Automaton.properties(solution)
        if attempt >= maxattempt and (error or not match): # error or no match after timeout
            grade = (score, feedback_timeout)
        elif error:
            grade = (-1, feedback_syntax_error.format(error))
        elif match:
            expected_size = len(info_solution["states"])
            if not info_solution["complete"]:
                expected_size += 1
            if not (info_student_answer["deterministic"] and info_student_answer["complete"]):
                score = 0 
                grade = (score, feedback_nondet)
            elif expected_size == len(info_student_answer["states"]) :
                score = 100
                grade = (score, feedback_match)
            else :
                score = 0
                grade = (score, feedback_nomini)
#               grade = (score, feedback_nomini.format(expected_size, len(info_student_answer["states"])))
        else:
            score = 0
            grade=(score, feedback_nomatch)

# TODO isomorph -- success iff the automaton of the student is isomorph to the automaton given in answer
elif answer_type == "automaton" and eval_type == "isomorph":
#    if attempt >= maxattempt: # timeout
#           grade = (score, feedback_timeout)
#    else:
#        attempt += 1
#        match, error = Automaton.isomorph(solution, student_answer)
#        equi, _ = Automaton.compare(solution, student_answer)
#        if  attempt >= maxattempt and (error or not match): # error or no match after timeout
#            grade = (score, feedback_timeout)
#        elif error:
#            grade = (-1, feedback_syntax_error.format(error))
#        elif match is True:
#            score = 100
#            grade = (score, feedback_match)
#        elseif not match and equi:
#            score = 0
#            grade=(score, feedback_equi_not_identical)
#        else:
#            score = 0
#            grade=(score, feedback_nomatch)
# A virer quand la fonction isomorph sera implémentée
    score = 0
    grade=(score, feedback_nondef)

# TODO same_as -- success iff the automaton of the student is the same (including states names) as the automaton given in solution
elif answer_type == "automaton" and eval_type == "same_as": 
    if attempt >= maxattempt: # timeout
           grade = (score, feedback_timeout)
    else:
        attempt += 1
        match = False
        error1 = False
#        match, error1 = Automaton.same_as(string_solution, string_student_answer)
        equi, error2 = Automaton.compare(solution, student_answer)
        if  attempt >= maxattempt and (error or error2 or not match): # error or no match after timeout
            grade = (score, feedback_timeout)
        elif error1:
            grade = (-1, feedback_syntax_error.format(error1))
        elif error2:
            grade = (-1, feedback_syntax_error.format(error2))
        elif match :
            score = 100
            grade = (score, feedback_match)
        elif equi:
            score = 0
            grade=(score, feedback_equi_not_identical.format(string_student_answer)
        else:
            score = 0
            grade=(score, feedback_nomatch)

# A virer quand la fonction same_as sera implémentée
#    score = 0
#    grade=(score, feedback_nondef)

# unknown eval_type -- define your own evaluator in the exercise
else :
    score = 0
    grade=(score, feedback_nondef)
==


















