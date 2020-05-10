
extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Partiel 2020 Exo3

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = '(b.(aa+a+ε))*ab*a'


solution = Automaton.from_regex_nd(message, simple=True)
#automate solution -- le nom solution est forcé par le template
#solution = '''
#    #states
#    S0
#    S1
#    S2
#    S3
#    S4
#    S5
#    S6
#    S7
#    #initials
#    S0
#    #accepting
#    S7
#    #alphabet
#    a
#    b
#    #transitions
#    S0:b>S1
#    S0:a>S5
#    S1:b>S1
#    S1:a>S2
#    S1:a>S4
#    S1:a>S5
#    S2:a>S3
#    S3:b>S1
#    S3:a>S5
#    S4:b>S1
#    S4:a>S5
#    S5:a>S7
#    S5:b>S6
#    S6:b>S6
#    S6:a>S7
#'''

# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
string_solution = solution

#Déécommenter les deux dernières lignes si besoin
#viewer_enonce permet un affichage non modifié de l'automate string_solution
#viewer_enonce = AutomatonDrawer()
#viewer_enonce.automaton = string_solution
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
# ----
# s'il est défini vous pouvez utiliser ce composant pour affciher l'automate des positions demandé
# {{ viewer_enonce|component }}
text==

On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$.<br/>
Donnez l'automate des positions correspondant à l'expression ```{{ message }}``` <br>
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










































