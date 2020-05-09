extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo position

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = 'a*b(b(aa+ε))*a'

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


#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = solution

#langage solution -- le nom solution est forcé par le template

==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
{{ solution_view|component }}
{{ viewer_enonce|component }}
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate des positions correspondant à l'expression {{ message }} <br>
<br>
Contraintes d'écriture pour l'évaluation:<br>
Compte tenu des bugs de l'éditeur sur le renommage des états, vous adopterez la convention suivante:
<ul>
<li> L'état S0 sera l'état initial de votre automate des positions
<li> Les états suivants Si pour i>0 représenteront les positions dans l'ordre de numérotation de l'expression. 
</ul>

{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






































