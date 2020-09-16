extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title =  Tirage aléatoire d'un exercice de prefixe, suffixe ou facteur

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from generator import Generator

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
bla = messages[mode]
textes_titre = {
   -1: 'Préfixe',
    0: 'Facteur',
    1: 'Suffixe'
}
bla_titre = textes_titre[mode]

# choix de la taille de l'alphabet
nb_lettres = random.choice([2,3])

#construction du langage solution, alphabet et mot
# -- le nom solution est forcé par le template
if mode == -1 :
    # Generator.prefix(nb lettres alphabet , longueur maxi du prefix)
    alphabet, mot, solution = Generator.prefix(nb_lettres,3,
    sorted_alphabet=True)
elif mode == 0 :
    # Generator.prefix(nb lettres alphabet , longueur maxi du facteur)
    alphabet, mot, solution = Generator.factor(nb_lettres,3,
    sorted_alphabet=True)
else :
    # Generator.prefix(nb lettres alphabet , longueur maxi du suffixe)
    alphabet, mot, solution = Generator.suffix(nb_lettres,3,
    sorted_alphabet=True)

alphabet = ', '.join(list(alphabet))
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots qui {{ bla }}  **{{ mot }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}

==












