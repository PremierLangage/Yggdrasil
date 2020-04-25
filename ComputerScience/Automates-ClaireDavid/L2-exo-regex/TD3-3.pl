

extends = ../templates/editor-regex.pl


generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse


viewer = Automaton.parse('(bb)*(b|a|ba)(aa)*')

alphabet = "a,b"
message = "L = { b^n.a^p tels que n ou p est impaire }"
==

title = TD3.1-3
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage  {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==

























