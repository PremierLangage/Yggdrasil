

extends = ../templates/editor.pl

maxattempt = 10

## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|

from automaton import Automaton
regexp = '(a|b)*(bab|bb)(bab)*'


#   transformation de l'automate de json en objet
automaton = Automaton.parse(regexp)

#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "l’ensemble des mots qui contiennent le facteur bab ou le facteur bb."
# peut-on utiliser la syntaxe du viewer ?
==

title = Partiel 2020 Exo1-1
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



















