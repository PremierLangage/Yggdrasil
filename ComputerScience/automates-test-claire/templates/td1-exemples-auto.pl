extends = editor.pl

maxattempt = 5

generate== #|py|
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
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==









