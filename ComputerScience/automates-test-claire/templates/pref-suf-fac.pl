extends = editor.pl

maxattempt = 5

generate== #|py|
from generator import Generator
# A mettre ailleurs peut-être?
import random
#choisi le mode

# Generator.prefix(nb lettres alphabet , longueur maxi du prefix)
nb_lettres = random.choice([2,3])
alphabet, prefix, automaton = Generator.prefix(nb_lettres,3)

==

title = Automates Préfixes
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots qui commencent par **{{ prefix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}

==
