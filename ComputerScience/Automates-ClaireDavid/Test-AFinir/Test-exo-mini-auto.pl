extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo mini from auto

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation en automate minimal
eval_type = "mini_auto"

alphabet = "a,b"

# automate de l'énoncé
enonce = '''
    #states
    S1
    S2
    S3
    S4
    S5
    S6
    S7
    S8
    S9
    #initials
    S1
    #accepting
    S9
    S4
    S7
    #alphabet
    a
    b
    #transitions
    S1:a>S2
    S1:b>S6
    S2:a>S7
    S2:b>S3
    S3:a>S9
    S3:b>S4
    S4:a>S9
    S4:b>S4
    S5:a>S7
    S5:b>S5
    S6:a>S7
    S6:b>S8
    S7:a>S5
    S7:b>S7
    S8:a>S9
    S8:b>S9
    S9:a>S4
    S9:b>S9
'''

#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = enonce

#langage solution -- le nom solution est forcé par le template
solution = Automaton.parse(enonce)

==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
<!--{{ viewer_enonce|component }}
{{ solution_view|component }}-->
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet correspondant à l'automate ci-dessus. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



































