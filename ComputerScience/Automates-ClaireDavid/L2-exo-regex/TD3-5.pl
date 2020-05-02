extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD3.1-5

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

#pour definir le type de réponse attendue (automaton par défaut)
answer_type = "simple-regex"

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = Automaton.parse('ab(a|b)(a|b)((a|b)(a|b)(a|b)(a|b))*')

#message de l'énoncé décrivant le langage
message = "des mots qui commencent par ab et dont la longueur est un multiple de 4."
==

text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



























