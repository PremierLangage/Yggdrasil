extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Same as

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
#from automaton import Automaton
from automaton import Automaton

# pour changer le type d'évaluation en automate minimal
eval_type = "same_as"

alphabet = "a,b"

# automate de l'énoncé
enonce = '''
    #states
    S0
    S1
    #initials
    S0
    #accepting
    S0
    #alphabet
    a
    b
    #transitions
    S0:a>S1
    S1:b>S0
'''

enonce2 = '''
    #states
    S0
    S1
    #initials
    S0
    #accepting
    S0
    #alphabet
    a
    b
    #transitions
    S1:b>S0
    S0:a>S1
'''

same_as_test = Automaton.same_as(enonce,enonce2)

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
{{ viewer_enonce|component }}
résultat : {{ same_as_test }}
<br>
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet correspondant à l'automate ci-dessus. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



































