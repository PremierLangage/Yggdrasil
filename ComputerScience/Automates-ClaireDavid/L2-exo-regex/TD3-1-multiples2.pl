extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD3.1-1

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

#pour definir le type de réponse attendue (automaton par défaut)
answer_type = "simple-regex"

alphabet = "0,1"

#langage solution -- le nom solution est forcé par le template
solution = Automaton.parse('(0|1)*0')

#message de l'énoncé décrivant le langage
message = " la représentation des entiers en binaire (big endian) qui sont des multiples de 2. <br>La représentation big endian correspond à mettre le bit de poids fort à gauche.<br>Par exemple l'entier $!41 = 2^5+2^3+2^0!$ est représenté par 101001 ou 0101001 ou 00101001 ... <br>"
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$ .<br/>
Donnez une expression reconnaissant le langage correspondant à {{ message }} 


<br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==





