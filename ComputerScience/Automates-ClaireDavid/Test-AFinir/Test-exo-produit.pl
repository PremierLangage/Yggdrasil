extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Exercice produit d'automates

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

# Mettre ici l'automate à déterminiser
# Attention pour l'instant numéroter les états à partir de zéro 
# et les définir dans l'ordre dans #states
automate1 = '''
    #states
    0
    1
    2
    #initials
    0
    #accepting
    1
    #alphabet
    a
    b
    #transitions
    0:a>1
    0:b>2
    1:a>0
    1:b>1
    2:a,b>2
'''

automate2 = '''
    #states
    4
    5
    6
    #initials
    4
    #accepting
    6
    #alphabet
    a
    b
    #transitions
    4:a,b>5
    5:a>6
    5:b>5
    6:a,b>6
'''



# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
# TODO - Ecrire string_soluce_produit
#string_solution = Automaton.string_soluce_produit(aautomate1,automate2)

string_solution = '''
    #states
    4
    5
    6
    #initials
    4
    #accepting
    6
    #alphabet
    a
    b
    #transitions
    4:a,b>5
    5:a>6
    5:b>5
    6:a,b>6
'''


#automate solution -- le nom solution est forcé par le template
solution = string_solution


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




