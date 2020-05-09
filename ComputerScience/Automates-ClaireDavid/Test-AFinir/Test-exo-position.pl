extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Automate des positions

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = '```a*b(b(aa+ε))*a```'

#automate solution -- le nom solution est forcé par le template
solution = '''
    #states
    S0
    S1
    S2
    S3
    S4
    S5
    S6
    #initials
    S0
    #accepting
    S6
    #alphabet
    a
    b
    #transitions
    S0:a>S1
    S0:b>S2
    S1:a>S1
    S1:b>S2
    S2:a>S6
    S2:b>S3
    S3:a>S4
    S3:b>S3
    S3:a>S6
    S4:a>S5
    S5:a>S6
    S5:b>S3
'''
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$.<br/>
Donnez l'automate des positions correspondant à l'expression {{ message }} <br>
<br>
**Contraintes d'écriture pour l'évaluation:**<br>
Compte tenu des bugs de l'éditeur sur le renommage des états, vous adopterez la convention suivante:
<ul>
<li> L'état S0 sera l'état initial de votre automate <br>*(Si vous avez besoin de plusieurs états initiaux, relisez votre cours)*
<li> Les états Sj pour j>0 représenteront les positions dans l'ordre de numérotation de l'expression.<br>
*Par exemple pour l'expression ```a*b+b```, l'état S1 représentera la position a1, l'état S2 représentera la position b2, et l'état S3 la position b3.*
</ul>

{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






































