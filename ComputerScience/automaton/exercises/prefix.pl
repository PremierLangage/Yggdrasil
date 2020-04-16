extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
from generator import Generator

alphabet, prefix, viewer = Generator.prefix(
    3, # length of the alphabet
    3  # max length of the prefix
)
==

title = Préfixe
text ==
Pour cette question, on considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots qui commencent par **{{ prefix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==









