
extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Partiel 2020 Exo2

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

# Mettre ici l'automate à déterminiser
# Attention pour l'instant numéroter les états à partir de zéro 
# et les définir dans l'ordre dans #states
enonce = '''
    #states
    0
    1
    2
    3
    4
    #initials
    0
    2
    #accepting
    0
    1
    #alphabet
    a
    b
    #transitions
    0:a>1
    0:a>2
    1:b>0
    1:a>3
    1:a>4
    2:a>2
    2:a>1
    3:a>1
    3:b>4
    4:b>3
    4:b>4
'''


# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
# TODO - Ecrire string_soluce_det
# Question -- mettre string soluce dans Automaton ou dans generator?
string_solution = Automaton.string_soluce_det(enonce)

#automate solution -- le nom solution est forcé par le template
solution = enonce


#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = string_solution




==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
{{ viewer_enonce|component }}
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$.<br/>
Donnez l'automate deterministe complet obtenu par l'algo vu en cours à partir de l'automate ci-dessus. <br>
<br>
**Contraintes d'écriture pour l'évaluation:**<br>
Afin de vérifier la correction de vos calculs et pas seulement la forme de l'automate, vous respecterez les conventions suivantes:
<ul>
<li> s'il est créé, l'état `ø` (aussi appelé état poubelle) sera nommé `P` ;
<li> les autres états seront nommés par la concatenation dans l'ordre croissant des états qui le constituent.
<br>
Par exemple, l'état `{5,1,4}` sera nommé `145`, l'état `{3}` sera nommé `3`, l'état `{4,6}` sera nommé `46`.
</ul>

{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==


