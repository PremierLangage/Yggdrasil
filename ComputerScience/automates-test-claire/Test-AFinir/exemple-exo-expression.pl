extends = ../templates/editor.pl

## exemple où l'automate est donné à partir d'une expression

maxattempt = 10

## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|

from automaton import Automaton
soluce = '(a|b)*(bab|bb)(bab)*'


#   transformation de l'automate de json en objet
automaton = Automaton.parse(soluce)

#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "l’ensemble des mots qui contiennent le facteur bab ou le facteur bb."
# peut-on utiliser la syntaxe du viewer ?
==

title = Bla - exemple avec soluce expression
text ==
{{viewer|component}}
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==





















