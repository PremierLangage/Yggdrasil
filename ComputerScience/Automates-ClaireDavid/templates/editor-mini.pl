# ## A finir -- ça ne marche pas
# 
# extends = editor-L2.pl
# 
# evaluator== #|py|
# from automaton import Automaton

# ERREUR: ici vous êtes dans le contexte python donc la valeur à droite doit êêtre entre guillemets 
 
# 
# #* feedback when the automaton is non deterministic or not complete.
# feedback_nondet = <p class="warning-state">L'automate correspond au langage mais n'est pas deterministe complet.</p>
# 
# #* feedback when the automaton is not minimal.
# feedback_mini = <p class="warning-state">L'automate correspond au langage. Il est det complet mais n'est pas minimal.</p>
# 
# if attempt >= maxattempt: # timeout
#     grade = (score, feedback_timeout)
# else:
#     attempt += 1
#     match, error = Automaton.compare(viewer, editor)
#     infos_editor , _ = Automaton.editor_properties(editor)

# ERREUR: la méthode properties n'était pas static je l'ai modifié dans automaton.py

#     info_viewer , _ = Automaton.properties(viewer)
#     if  attempt >= maxattempt and (error or not match): # error or no match after timeout
#         grade = (score, feedback_timeout)
#     elif error:
#         grade = (-1, feedback_syntax_error.format(error))
#     elif match is True :

# ERREUR: vous êtes dans un contexte python il manque des guillemets dans les crochets

#         if not (infos_editor[deterministic] and infos_editor[complete]):
#             score = 0 
#             grade(score,feedback_nondet)

# ERREUR: vous êtes dans un contexte python il manque des guillemets dans les crochets de plus la condition est fausse il fallait tester une inégalité
# de plus le dictionnaire renvoyé par Automaton.properties ne contenait pas "states" je l'ai rajouté.

#         elif len(infos_viewer[states]) == len(infos_editor[states]) :
#             score = 0

# ERREUR: feedback_non_mini existe pas

#             grade = (score, feedback_non_mini)
#         else :
#             score = 100
#             grade = (score, feedback_nomatch)
#     else:
#         score = 0
#         grade=(score, feedback_nomatch)
# ==



# VERSION CORRIGÉE

extends = editor-L2.pl

#* feedback when the automaton is non deterministic or not complete.
feedback_nondet = <p class="warning-state">L'automate correspond au langage mais n'est pas deterministe complet.</p>
#* feedback when the automaton is not minimal.
feedback_nomini = <p class="warning-state">Votre automate est deterministe complet et correspond au langage mais il n'est pas minimal {0} vs {1}.</p>

evaluator== #|py|
from automaton import Automaton

if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    attempt += 1
    match, error = Automaton.compare(viewer, editor)
    info_viewer , _ = Automaton.properties(viewer)
    # Automaton.properties will detect if editor is the an instance of AutomatonEditor
    # and call editor_properties to not alterate the student automaton
    info_editor , _ = Automaton.properties(editor)
    if attempt >= maxattempt and (error or not match): # error or no match after timeout
        grade = (score, feedback_timeout)
    elif error:
        grade = (-1, feedback_syntax_error.format(error))
    elif match:
        expected_size = len(info_viewer["states"])
        if not info_viewer["complete"]:
            expected_size += 1
        if not (info_editor["deterministic"] and info_editor["complete"]):
            score = 0 
            grade = (score, feedback_nondet)
        elif expected_size == len(info_editor["states"]) :
            score = 100
            grade = (score, feedback_match)
        else :
            score = 0
            grade = (score, feedback_nomini.format(expected_size, len(info_editor["states"])))
#            grade = (score, feedback_nomini.format(expected_size, len(info_editor["states"])))
    else:
        score = 0
        grade=(score, feedback_nomatch)
==







