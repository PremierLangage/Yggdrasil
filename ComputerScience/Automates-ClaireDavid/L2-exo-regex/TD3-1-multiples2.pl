extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD3.1-1

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

#pour definir le type de réponse attendue (automaton par défaut)
answer_type = "simple-regex"

alphabet = "0,1"

viewer = Automaton.parse('(0|1)*0')

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



