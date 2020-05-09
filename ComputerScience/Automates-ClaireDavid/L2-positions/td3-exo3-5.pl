

extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = td3 exo 3-5

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = '```(a+ε)(ba+b)*```'

#automate solution -- le nom solution est forcé par le template
solution = '''
    #states
    S0
    S1
    S2
    S3
    S4
    #initials
    S0
    #accepting
    S0;S1;S3;S4
    #alphabet
    a
    b
    #transitions
    S0:a>S1
    S0:b>S2
    S0:b>S4
    S1:b>S2
    S1:b>S4
    S2:a>S3
    S3:b>S2
    S3:b>S4
    S4:b>S4
    S4:b>S2
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
<li> L'état S0 sera l'état initial de votre automate. <br>
<li> Les états Sj pour j>0 représenteront les positions dans l'ordre de numérotation de l'expression.<br>
</ul>

{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==







































