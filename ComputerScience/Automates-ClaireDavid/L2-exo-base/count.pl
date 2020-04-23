extends = ../templates/editor-L2.pl

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

editor.debug = False
editor.editorHeight = "520px"


alphabet, letter, occurences, viewer = Generator.counting(
    3, # max_symbs
    4, # max_word_length
    mode,
    sorted_alphabet=True
)
alphabet = ', '.join(list(alphabet))
==

title = Nombre d'occurences
text== #|html|
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }} mots ayant {{ message }} **{{ occurences }}** occurrences de la lettre **{{ letter }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==














