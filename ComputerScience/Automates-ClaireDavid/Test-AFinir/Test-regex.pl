extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo mini from regex

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation en automate minimal
eval_type = "mini_auto"

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = 'a*b(b(aa+€))*a'


## TODO donner une seule description du lanage enoncé pour le message et l'automate
#langage solution -- le nom solution est forcé par le template
solution = Automaton.from_regex_nd('a*b(baa|b)*a')
states = solution.state_machine.states
initial = solution.state_machine.initial
final = solution.state_machine.finals
transitions = ['%s->%s->%s' % (src, symbol, dest) for src in solution.state_machine.map for symbol in solution.state_machine.map[src] for dest in solution.state_machine.map[src][symbol]]
#viewer_enonce = solution.as_viewer()

#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = solution.to_string_notation()

#langage solution -- le nom solution est forcé par le template

==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
states {{ states }}
initial {{ initial }}
final {{ final }}
transitions {{ transitions }}

{{ viewer_enonce|component }}
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==




































