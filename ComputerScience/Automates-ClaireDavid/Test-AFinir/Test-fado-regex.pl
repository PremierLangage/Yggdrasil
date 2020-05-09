extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo mini from regex

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton
from automaton import *

# pour changer le type d'évaluation quand le mode sera implémenté
#eval_type = "same_as"

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = 'a*b(b(aa+€))*a'

#langage solution -- le nom solution est forcé par le template
solution = Automaton.from_regex_nd(message, simple=True)

#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = solution

#langage solution -- le nom solution est forcé par le template

==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
{{ solution_view|component }}
{{ viewer_enonce|component }}
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==





































