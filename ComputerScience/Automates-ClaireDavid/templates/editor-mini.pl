## A finir -- ça ne marche pas

extends = editor-L2.pl

#* feedback when the automaton is non deterministic or not complete.
feedback_nondet = <p class="warning-state">L'automate correspond au langage mais n'est pas deterministe complet.</p>

#* feedback when the automaton is not minimal.
feedback_nomini = <p class="warning-state">L'automate correspond au langage. Il est det complet mais n'est pas minimal.</p>

evaluator== #|py|
from automaton import Automaton
import sys
if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    attempt += 1
    match, error = Automaton.compare(viewer, editor)
    info_viewer , _ = Automaton.properties(viewer)
    info_editor , _ = Automaton.editor_properties(editor)
    if  attempt >= maxattempt and (error or not match): # error or no match after timeout
        grade = (score, feedback_timeout)
    elif error:
        grade = (-1, feedback_syntax_error.format(error))
    elif match is True :
        print('match', file=sys.stderr)
        if not (info_editor["deterministic"] and info_editor["complete"]):
            score = 0 
            grade(score, feedback_nondet)
        elif len(info_viewer["states"]) != len(info_editor["states"]) :
            score = 0
            grade = (score, feedback_nomini)
        else :
            score = 100
            grade = (score, feedback_match)
    else:
        score = 0
        grade=(score, feedback_nomatch)
==





