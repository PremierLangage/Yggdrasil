

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
solution = Automaton.from_regex_nd(enonce, simple=True)

# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
string_solution = solution

#Décommenter les deux dernières lignes si besoin d'afficher l'automate des positions
#viewer_enonce permet un affichage non modifié de l'automate string_solution
#viewer_enonce = AutomatonDrawer()
#viewer_enonce.automaton = string_solution
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
# ----
# s'il est défini vous pouvez utiliser {{ viewer_enonce|component }}
# dans ce qui suit pour affciher l'automate des positions demandé.
# 
text==

On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$.<br/>
Donnez l'automate des positions correspondant à l'expression ```{{enonce }}``` <br>
<br>
**Contraintes d'écriture pour l'évaluation:**<br>
Pour le nommage des états, vous respecterez la convention suivante:
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










































