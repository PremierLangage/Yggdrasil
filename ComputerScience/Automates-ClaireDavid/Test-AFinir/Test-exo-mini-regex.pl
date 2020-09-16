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
solution = Automaton.parse('a*b(baa|b)*a')
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



































