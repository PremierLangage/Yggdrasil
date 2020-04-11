extends = editor.pl

maxattempt = 5

generate== #|py|
from generator import Generator
# A mettre ailleurs peut-être?
import random
#choisi le type d'exo
#    -1: 'prefixe',
#    0: 'facteur',
#    1: 'suffixe'
mode = random.choice([-1, 0, 1])
messages = {
    -1: 'commencent par',
    0: 'contiennent',
    1: 'finissent par'
}

# choix de la taille de l'alphabet
    nb_lettres = random.choice([2,3])

if mode == -1 :
    # Generator.prefix(nb lettres alphabet , longueur maxi du prefix)
    alphabet, prefix, automaton = Generator.prefix(nb_lettres,3)
elif mode == 0 :
    # Generator.prefix(nb lettres alphabet , longueur maxi du facteur)
    alphabet, facteur, automaton = Generator.facteur(nb_lettres,3)
else :
    # Generator.prefix(nb lettres alphabet , longueur maxi du suffixe)
    alphabet, suffixe, automaton = Generator.suffixe(nb_lettres,3)
==

title = Préfixe, suffixe ou facteur 
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots qui commencent par **{{ prefix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}

==



========
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

title = Automates Occurences
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }} mots ayant {{ message }} **{{ n }}** occurrences de la lettre **{{ letter }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==

