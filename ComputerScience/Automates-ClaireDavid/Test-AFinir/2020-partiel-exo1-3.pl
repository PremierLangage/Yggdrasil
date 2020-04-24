
extends = ../templates/editor-regex.pl


generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse


viewer = Automaton.parse('(a|b)*(bab|bb)(a|b)*')

alphabet = "a,b"
message = "L’ensemble des mots qui contiennent le facteur bab ou le facteur bb."
==

title = Partiel 2020 Exo1-3
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






















