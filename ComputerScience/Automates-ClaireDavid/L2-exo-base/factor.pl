extends = ../templates/editor.pl

maxattempt = 10

generate== #|py|
from generator import Generator
# A mettre ailleurs peut-être?
import random
#choisi le type d'exo
#    -1: 'prefixe',
#    0: 'facteur',
#    1: 'suffixe'
#mode = random.choice([-1, 0, 1])
mode = 0
messages = {
    -1: 'commencent par',
    0: 'contiennent',
    1: 'finissent par'
}
bla = messages[mode]
textes_titre = {
   -1: 'Préfixe',
    0: 'Facteur',
    1: 'Suffixe'
}
bla_titre = textes_titre[mode]

# choix de la taille de l'alphabet
nb_lettres = random.choice([2,3])

if mode == -1 :
    # Generator.prefix(nb lettres alphabet , longueur maxi du prefix)
    alphabet, mot, viewer = Generator.prefix(nb_lettres,3)
elif mode == 0 :
    # Generator.prefix(nb lettres alphabet , longueur maxi du facteur)
    alphabet, mot, viewer = Generator.factor(nb_lettres,3)
else :
    # Generator.prefix(nb lettres alphabet , longueur maxi du suffixe)
    alphabet, mot, viewer = Generator.suffix(nb_lettres,3)


alphabet = ', '.join(list(alphabet))
==

title = Facteur
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots qui {{ bla }}  **{{ mot }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}

==










