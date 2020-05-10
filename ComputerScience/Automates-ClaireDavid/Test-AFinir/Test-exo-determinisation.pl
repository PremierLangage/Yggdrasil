extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Exo déterminisation

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

# Mettre ici l'automate à déterminiser
enonce = '''
    #states
    S0
    S1
    S2
    #initials
    S0
    S1
    #accepting
    S2
    #alphabet
    a
    b
    #transitions
    S0:b>S1
    S0:b>S2
    S1:a>S1
    S1:a>S2
    S1:b>S1
    S2:a>S0
    S2:a>S2
'''

# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
# TODO - Ecrire string_soluce_det
# Question -- mettre string soluce dans Automaton ou dans generator?
string_solution = Automaton.string_soluce_det(enonce)

#automate solution -- le nom solution est forcé par le template
solution = enonce


#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = enonce




==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
{{ viewer_enonce|component }}
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$.<br/>
Donnez l'automate deterministe complet obtenu par l'algo vu en cours à partir de l'automate donné. <br>
<br>
**Contraintes d'écriture pour l'évaluation:**<br>
Afin de vérifier la correction de vos calculs et pas seulement la forme de l'automate, vous respecterez les conventions suivantes pour le nom des états
<ul> un état correspondant à un ensemble non vide sera nommé par la concatenation dans l'ordre croissant des noms des états qui le constituent.
<br>
Exemples l'état `{5,1,4}` sera nommé `145`, l'état `{3}` sera nommé `3`, l'état `{4,6}` sera nommé `46`.
<li> s'il est créé, l'état `ø` (aussi appelé état poubelle) sera nommé `P` 
</ul>

{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==














































