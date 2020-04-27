



extends = ../templates/editor-mini.pl



## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
from automaton import Automaton

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

viewer = enonce

viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = enonce

#    l'alphabet
alphabet = "a,b"
==

# dans ce qui suit le pb est que le viewer contient l'automate minimisé et non celui de départ
title = Minimisation
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




























