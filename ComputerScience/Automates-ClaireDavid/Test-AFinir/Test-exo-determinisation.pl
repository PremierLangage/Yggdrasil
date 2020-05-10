
extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Automate de determinisation simple

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

# Mettre ici l'automate à déterminiser
enonce = '''
	#states
		s1
		s2
		s3
	#initials
		s1
		s2
	#accepting
		s3
	#alphabet
		a
		b
	#transitions
		s1:b>s2
		s1:b>s3
		s2:a>s2
		s2:a>s3
		s2:b>s2
		s3:a>s1
		s3:a>s3
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
Donnez l'automate deterministe complet obtenu par l'algo vu en cours à partir de l'automate donné. <br>
<br>
**Contraintes d'écriture pour l'évaluation:**<br>
Afin de vérifier la correction de vos calculs et pas seulement la forme de l'automate, vous respecterrez les conventions suivantes pour le nom des états
<ul>
<li> sera l'état initial de votre automate. <br>*(Si vous avez besoin de plusieurs états initiaux, relisez votre cours)*
<li> Les états Sj pour j>0 représenteront les positions dans l'ordre de numérotation de l'expression.<br>
*Exemple pour l'expression ```a*b+b``` qui se numérote ```a1*b2+b3```, l'état S1 représenterai la position a1, l'état S2 la position b2, et l'état S3 la position b3.*
</ul>

{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==













































