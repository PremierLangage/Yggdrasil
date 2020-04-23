extends = editor.pl

evaluator== #|py|
from automaton import Automaton

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
#        infos, _ = Automaton.informations(editor)
        score = 100
        grade = (score, feedback_match)
    else:
        score = 0
        grade=(score, feedback_nomatch)
==
