extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD3.1-1

generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse


viewer = Automaton.parse('(0|1)*0')

alphabet = "0,1"
message = "à la représentation des entiers en base 2 qui sont des multiples de 2"
==


text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



