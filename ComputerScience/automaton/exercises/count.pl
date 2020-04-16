extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|

import random
from generator import Generator

mode = random.choice([-1, 0, 1])

message = {
    -1: 'au moins',
    0: 'exactement',
    1: 'au plus'
}[mode]

alphabet, letter, occurences, viewer = Generator.counting(
    3, # length of the alphabet
    4, # max length of the word to generate
    mode
)
==

title = Automates Occurences
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }} mots ayant {{ message }} **{{ occurences }}** occurrences de la lettre **{{ letter }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==




