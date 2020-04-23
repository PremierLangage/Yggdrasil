## A finir

extends = editor-L2.pl

evaluator== #|py|
from automaton import Automaton


#* feedback shown after a timeout.
feedback_nondet = <p class="warning-state">L'automate correspond au langage mais n'est pas deterministe complet.</p>

if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    attempt += 1
    match, error = Automaton.compare(viewer, editor)
    if  attempt >= maxattempt and (error or not match): # error or no match after timeout
        grade = (score, feedback_timeout)
    elif error:
        grade = (-1, feedback_syntax_error.format(error))
    elif match is True:
        infos_editor , _ = Automaton.editor_properties(editor)
        info_viewer , _ = Automaton.properties(viewer)
        if not (infos_editor[deterministic] and infos_editor[complete]):
            score = 0 
            grade(score,feedback_nondet)
        elif len(infos_viewer[states]) == len(infos_editor[states])
            score = 0
            grade = (score, feedback_non_mini)
        else
            score = 100
            grade = (score, feedback_match)
    else:
        score = 0
        grade=(score, feedback_nomatch)
==
