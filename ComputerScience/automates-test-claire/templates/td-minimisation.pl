############### A FINIR #########################
extends = exo-egalite-auto.pl


maxattempt = 5

generate== #|py|
## Ajouter ici la génération:
#    la construction de l'automate pour tester la réponse

# peut-on utiliser la syntaxe du viewer ?
import random
from generator import Generator
mode = random.choice([-1, 0, 1])
messages = {
    -1: 'au moins',
    0: 'exactement',
    1: 'au plus'
}
message = messages[mode]
# counting( nb lettres alphabet, nb occurences demandées , mode)
alphabet, letter, n, automaton = Generator.counting(3, 4, mode)

==

title = Exemples de langages
text ==
{{ viewer|component }}
Donnez l'automate minimal déterministe complet correspondant au langage reconnu par cet automate. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}
==









