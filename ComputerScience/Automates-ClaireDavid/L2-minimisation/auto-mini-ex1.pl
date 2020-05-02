extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = automate-1

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation en automate minimal
eval_type = "mini_auto"

alphabet = "a,b"

# automate de l'énoncé
enonce = '''
    #states
    S0
    S1
    S2
    S3
    S4
    S5
    #initials
    S1
    #accepting
    S1
    S4
    #alphabet
    a
    b
    #transitions
    S0:b>S1
    S1:a>S0
    S1:a>S5
    S1:b>S2
    S2:a>S1
    S2:b>S1
    S3:a>S4
    S3:b>S1
    S4:a>S5
    S4:b>S3
    S5:b>S4
'''

#viewer est le langage solution -- le nom est forcé le reste. On changera plus tard
viewer = enonce


#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = enonce

#    l'alphabet
alphabet = "a,b"
==

# dans ce qui suit le pb est que le viewer contient l'automate minimisé et non celui de départ
text ==
{{ viewer_enonce|component }}

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet correspondant àà l'automate ci-dessus. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






























