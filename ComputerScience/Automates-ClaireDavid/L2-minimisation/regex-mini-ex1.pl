extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = regex 1
#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation en automate minimal
eval_type = "mini_auto"

alphabet = "a,b"

#viewer est le langage solution -- le nom est forcé le reste. On changera plus tard
viewer = Automaton.parse('bb*a(b*a)*')

#    l'alphabet
alphabet = "a,b"
message = 'bb * a(b * a) *'
==


text ==

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






























