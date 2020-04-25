

extends = ../templates/editor-regex.pl


generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse


viewer = Automaton.parse('b(a|b)((a|b)(a|b))*b|b')

alphabet = "a,b"
message = "des mots de longueur impaire qui commencent et se terminent par b."
==

title = TD3.1-6

text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==


























