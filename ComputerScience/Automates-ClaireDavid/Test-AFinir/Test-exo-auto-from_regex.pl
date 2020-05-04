extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo auto from regex

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = Automaton.parse('a*b(baa|b)*a')

#message de l'énoncé décrivant le langage
message = " le langage (ab+a)*"
==


#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






























