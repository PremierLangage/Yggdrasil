extends = ../templates/exo-sql.pl

#* titre de l'exercice
title = Exercice test

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from generator import Generator

import random
#choisi le type d'exo
#    -1: 'prefixe',
#    0: 'facteur',
#    1: 'suffixe'
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
text== #|html|
On considère le schema suivant. Donnez une requete qui calcule {{ question }}. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==
